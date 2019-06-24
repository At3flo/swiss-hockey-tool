class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @location = Club.find(current_user.club_id).field_address

    @contact = "#{current_user.first_name} #{current_user.last_name}, #{current_user.phone_number}, #{current_user.email}"
    @categories = []
    Category.all.each do |category|
      @categories << "#{t 'underShortened'}#{category.age} #{category.level}#{category.gender.capitalize if category.gender == 'girls'}".strip
    end
  end
end
