class EventsController < ApplicationController
  def create
    @event = Event.new(date: params["date"])
    raise

  end
end
