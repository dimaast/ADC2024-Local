class Admin::MailersController < ApplicationController
  load_and_authorize_resource
  before_action :set_mailer, only: %i[ show edit update destroy ]

  def index
    @mailers = Mailer.all
  end

  def new
    @mailer = Mailer.new
  end

  def edit
  end

  def create
    @mailer = Mailer.new(mailer_params)

    respond_to do |format|
      if @mailer.save
        format.html { redirect_to admin_mailers_path, notice: "Mailer was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mailer.update(mailer_params)
        format.html { redirect_to admin_mailers_path, notice: "mailer was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mailer.destroy!

    respond_to do |format|
      format.html { redirect_to admin_mailers_path, status: :see_other, notice: "Fill was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_mailer
      @mailer = Mailer.find(params[:id])
    end

    def mailer_params
      params.require(:mailer).permit(:email)
    end
end