class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]

  def create
    @event = Event.new(event_params)
    @event.places_left = @event.total_places
    @event.user = current_user
    @event.is_tournament_open = true

    authorize @event

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

    @open = t 'open'
    @close = t 'close'
    
    @indoor = t 'indoor'
    @outdoor = t 'outdoor'

    @morning = t 'morning'
    @afternoon = t 'afternoon'
    @fullDay = t 'fullDay'
  end

  def update
    @event.date = Time.new(params[:event]["date(1i)"], params[:event]["date(2i)"], params[:event]["date(3i)"]).strftime("%F")
    @event.period = params[:event][:period]
    @event.start_time = Time.new(2000, 1, 1, params[:event]["start_time(4i)"], params[:event]["start_time(5i)"]).strftime("%H:%M")
    @event.places_left += params[:event][:total_places].to_i - @event.total_places.to_i
    @event.total_places = params[:event][:total_places].to_i
    @event.location = params[:event][:location]
    @event.contact = params[:event][:contact]
    @event.is_tournament_open = params[:event][:is_tournament_open]
    @event.is_outdoor = params[:event][:is_outdoor]
    @event.other_informations = params[:event][:other_informations]
    @event.user = current_user
    @event.category = Category.find(params[:event][:category_id].to_i)
    
    @event.is_tournament_open = false if @event.places_left == 0

    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @event.destroy

    redirect_to root_path
  end

  private

  def set_event
    @event = Event.find(params[:id])

    authorize @event
  end

  def event_params
    params.permit(:date, :period, :start_time, :club_id, :is_outdoor, :location, :contact, :category_id, :total_places, :other_informations)
  end
end