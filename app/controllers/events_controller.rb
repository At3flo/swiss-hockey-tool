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

  private

  def event_params
    params.permit(:date, :period, :start_time, :club_id, :is_outdoor, :location, :contact, :category_id, :places_left, :other_informations)
  end
end
