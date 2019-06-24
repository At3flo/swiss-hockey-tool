class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @categories = []
    Category.all.each do |category|
      @categories << "#{t 'underShortened'}#{category.age} #{category.level}#{category.gender.capitalize if category.gender == 'girls'}".strip
    end
  end
end
