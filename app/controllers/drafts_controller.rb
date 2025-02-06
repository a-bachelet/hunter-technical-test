class DraftsController < ApplicationController
  def index
  end

  def create
    draft = Draft.create(
      purpose: params[:purpose],
      recipient: params[:recipient],
      sender: params[:sender],
    )

    ai_service = AiService.new
    cold_email = ai_service.generate_cold_email(draft)

    draft.update(
      subject: cold_email[:subject],
      body: cold_email[:body]
    )

    redirect_to draft
  end

  def show
    @draft = Draft.find(params[:id])
  end
end
