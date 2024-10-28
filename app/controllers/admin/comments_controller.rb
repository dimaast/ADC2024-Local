class Admin::CommentsController < ApplicationController
    def create
        @event = Event.find(params[:event_id])
        @comment = @event.comments.create(params[:comment].permit(:body))
        redirect_to admin_event_path(@event)
    end

    def destroy
        @event = Event.find(params[:event_id])
        @comment = @event.comments.find(params[:id])
        @comment.destroy
        redirect_to admin_event_path(@event)
    end
end