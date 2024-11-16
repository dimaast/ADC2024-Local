class Api::V1::EventsController < ApplicationController
  def index
    @events = Event.all
    # render json: @events
  end

  def show
    @event = Event.find(params[:id])
  end
end
