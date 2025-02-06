class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def index
  end

  def write
    @purpose = params[:purpose]
    @recipient = params[:recipient]
    @sender = params[:sender]

    ai_service = AiService.new

    @cold_email = ai_service.generate_cold_email(@purpose, @recipient, @sender)

    puts @cold_email
  end
end
