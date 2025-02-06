class DraftsController < ApplicationController
  def index
  end

  def create
    @purpose = params[:purpose]
    @recipient = params[:recipient]
    @sender = params[:sender]

    ai_service = AiService.new

    @cold_email = ai_service.generate_cold_email(@purpose, @recipient, @sender)
  end

  def destroy
  end
end
