class EventsController < ApplicationController

  def index
    @events = Event.all.order(created_at: :desc)
  end

  def create
    event_params = params
    @event = Event.new(
      google_event_id: event_params["id"],
      name: event_params["name"],
      address: event_params["address"],
      user_email: event_params["user_email"],
      start_time: event_params["start_time"],
      departure_time: event_params["departure_time"],
      device_token: event_params["device_token"],
      user_lat: event_params["user_lat"],
      user_lng: event_params["user_lng"],
      event_lat: event_params["event_lat"],
      event_lng: event_params["event_lng"]
      )
    if @event.save
      render text: 'Event saved'
    else
      render text: 'Event not saved'
    end
  end

end
