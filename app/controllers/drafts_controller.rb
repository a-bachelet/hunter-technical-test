class DraftsController < ApplicationController
  def index
    @drafts = Draft.order(created_at: :desc)
    @reference = Draft.find_by(id: params[:reference_id]) if params[:reference_id]
  end

  def create
    draft = Draft.create(
      purpose: params[:purpose],
      recipient: params[:recipient],
      sender: params[:sender],
      tone: params[:tone],
      reading_time: params[:reading_time],
      language: params[:language]
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

  def destroy
    Draft.find(params[:id])&.destroy

    redirect_to drafts_path
  end
end
