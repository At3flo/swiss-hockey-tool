class EventsController < ApplicationController
  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.is_tournament_open = true
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @categories = []
    Category.all.each do |category|
      @categories << "#{t 'underShortened'}#{category.age} #{category.level}#{category.gender.capitalize if category.gender == 'girls'}".strip
    end

    @event = Event.find(params[:id])
    
    @indoor = t 'indoor'
    @outdoor = t 'outdoor'

    @morning = t 'morning'
    @afternoon = t 'afternoon'
    @fullDay = t 'fullDay'
  end

  def update
    @event = Event.find(params[:id])
    raise
  end

  private

  def event_params
    params.permit(:date, :period, :start_time, :club_id, :is_outdoor, :location, :contact, :category_id, :places_left, :other_informations)
  end
end