class MailersController < ApplicationController
  load_and_authorize_resource

  def create
    @mailer = Mailer.new(mailer_params)

    respond_to do |format|
      if @mailer.save
        format.turbo_stream { render :show }
        # format.html { redirect_to root_path, notice: "You've just subscribed" }
      else
        format.html { redirect_to root_path, notice: "Some error" }
      end
    end
  end

  private
    def mailer_params
      params.require(:mailer).permit(:email)
    end

end