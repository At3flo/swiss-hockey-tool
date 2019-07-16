class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if user_signed_in?
      @location = Club.find(current_user.club_id).field_address

      @contact = "#{current_user.first_name} #{current_user.last_name}, #{current_user.phone_number}, #{current_user.email}"
    end
    
    @categories = []
    Category.all.each do |category|
      @categories << "#{t 'underShortened'}#{category.age} #{category.level}#{category.gender.capitalize if category.gender == 'girls'}".strip
    end
    
    sql_query = " \
    SELECT *
    FROM events
    ORDER BY date
    ASC;"

    @events = Event.connection.execute(sql_query)

    @clubs = Club.all

    @clubs_id_name = []

    @clubs.each do |club|
      @clubs_id_name[club[:id]] = club.name
    end

    @confirmRemoveTeam = t 'confirmRemoveTeam'
    @selectsOneOrMoreCategories = t 'selectsOneOrMoreCategories'

  end

end
