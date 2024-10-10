class CommentsController < ApplicationController
    before_action :set_event, only: %i[ show edit update destroy ]

    # GET /comment or /comment.json
    def index
      @comments = Comment.all
    end

    def create
        @event = Event.find(params[:event_id])
        @comment = @event.comments.create(params[:comment].permit(:body))
        redirect_to event_path(@event)
    end

    def destroy
        @event = Event.find(params[:event_id])
        @comment = @event.comments.find(params[:id])
        @comment.destroy
        redirect_to event_path(@event)
    end
end
