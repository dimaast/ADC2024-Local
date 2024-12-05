class MCommentsController < ApplicationController
  before_action :set_m_comment, only: %i[ show edit update destroy ]

  def index
    @m_comments = MComment.all
  end

  def show
  end

  def new
    @m_comment = MComment.new
  end

  def edit
  end

  def create
    @m_comment = current_user.m_comments.new(m_comment_params)
    @meet = Meet.find(params[:meet_id])

    respond_to do |format|
      if @m_comment.save
        format.html { redirect_to @m_comment.meet, notice: "Comments was successfully created." }
        format.json { render :show, status: :created, location: @m_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @m_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @m_comment.update(m_comment_params)
        format.html { redirect_to @m_comment, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @m_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @m_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @m_comment.destroy!

    respond_to do |format|
      format.html { redirect_to @m_comment.meet, status: :see_other, notice: "Comments was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_m_comment
      @m_comment = MComment.find(params[:id])
    end

    def m_comment_params
      params.require(:m_comment).permit(:body).merge(meet_id: params[:meet_id])
    end
end
