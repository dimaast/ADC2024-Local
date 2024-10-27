class EventsController < ApplicationController
  load_and_authorize_resource

  def index
    if current_user
      @events = Event.all
    else
      @events = Event.where(public: true)
    end
  end

  # GET /events/1 or /events/1.json
  def show
    @event = Event.find(params[:id])
  end
end
