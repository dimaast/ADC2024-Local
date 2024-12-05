class ECommentsController < ApplicationController
  before_action :set_e_comment, only: %i[ show edit update destroy ]

  def index
    @e_comments = EComment.all
  end

  def show
  end

  def new
    @e_comment = EComment.new
  end

  def edit
  end

  def create
    @e_comment = current_user.e_comments.new(e_comment_params)
    @event = Event.find(params[:event_id])

    respond_to do |format|
      if @e_comment.save
        format.html { redirect_to @e_comment.event, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @e_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @e_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @e_comment.update(e_comment_params)
        format.html { redirect_to @e_comment, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @e_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @e_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @e_comment.destroy!

    respond_to do |format|
      format.html { redirect_to @e_comment.event, status: :see_other, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_e_comment
      @e_comment = EComment.find(params[:id])
    end

    def e_comment_params
      params.require(:e_comment).permit(:body).merge(event_id: params[:event_id])
    end
end
