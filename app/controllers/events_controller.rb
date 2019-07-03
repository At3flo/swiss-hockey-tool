class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]

  def create
    @event = Event.new(date: params[:date], 
      period: params[:period], 
      start_time: params[:start_time], 
      club_id: params[:club_id], 
      is_outdoor: params[:is_outdoor],
      location: params[:location],
      contact: params[:contact],
      other_informations: params[:other_informations]
    )

    categories_h = {}
    Category.all.each do |category|
      if params["category-#{category.id}"]
        categories_h[category.id] = { "places_left": params["total_places-#{category.id}"].to_i, "total_places": params["total_places-#{category.id}"].to_i }
      else 
        categories_h[category.id] = { "places_left": 0, "total_places": 0 }
      end
    end

    @event.categories = categories_h
    @event.user = current_user
    
    @event.is_tournament_open = true

    authorize @event

    if @event.save!
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
    @event.location = params[:event][:location]
    @event.contact = params[:event][:contact]
    @event.is_tournament_open = params[:event][:is_tournament_open]
    @event.is_outdoor = params[:event][:is_outdoor]
    @event.other_informations = params[:event][:other_informations]
    @event.user = current_user

    
    categories_h = {}
    Category.all.each do |category|
      if params["category-#{category.id}"]
        categories_h[category.id] = { "places_left": @event[:categories][category.id.to_s]["places_left"].to_i + (params["total_places-#{category.id}"].to_i - @event[:categories][category.id.to_s]["places_left"].to_i), "total_places": params["total_places-#{category.id}"].to_i }
      else 
        categories_h[category.id] = { "places_left": 0, "total_places": 0 }
      end
    end

    @event.categories = categories_h

    if @event.save!
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

end