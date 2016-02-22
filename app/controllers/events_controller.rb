class EventsController < ApplicationController

  def index
    @events = Event.all.order(created_at: :desc)
  end

  def create
    event_params = params
    @event = Event.new(
      name: event_params["name"],
      address: event_params["address"],
      user_email: event_params["user_email"],
      start_time: event_params["start_time"]
      )
    if @event.save
      render text: 'Event saved'
    else
      render text: 'Event not saved'
    end
  end

end
