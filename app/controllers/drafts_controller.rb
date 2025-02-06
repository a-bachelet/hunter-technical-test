class DraftsController < ApplicationController
  def index
    @drafts = Draft.order(created_at: :desc)
    @reference = Draft.find_by(id: params[:reference_id]) if params[:reference_id]
  end

  def show
    @draft = Draft.find(params[:id])
  end

  def create
    draft = Draft.new(
      purpose: draft_params[:purpose],
      recipient: draft_params[:recipient],
      sender: draft_params[:sender],
      tone: draft_params[:tone],
      reading_time: draft_params[:reading_time],
      language: draft_params[:language]
    )

    if draft.save
      ai_service = AiService.new
      cold_email = ai_service.generate_cold_email(draft)

      draft.update(
        subject: cold_email[:subject],
        body: cold_email[:body]
      )

      flash[:success] = "Draft created successfully!"
      redirect_to draft
    else
      puts draft.errors.full_messages
      flash[:errors] = draft.errors.full_messages
      redirect_to root_path
    end
  end

  def refine
    draft = Draft.find(params[:id])

    ai_service = AiService.new
    refinment = ai_service.refine_cold_email(draft, refine_params[:instructions])

    if draft.update(subject: refinment[:subject], body: refinment[:body])
      flash[:success] = "Draft refined successfully!"
      redirect_to draft
    else
      puts draft.errors.full_messages
      flash[:errors] = draft.errors.full_messages
      redirect_to draft
    end
  end

  def destroy
    Draft.find(params[:id])&.destroy

    flash[:success] = "Draft deleted successfully!"
    redirect_to drafts_path
  end

  private

  def index_params
    params.permit(:reference_id)
  end

  def draft_params
    params.permit(:purpose, :recipient, :sender, :tone, :reading_time, :language)
  end

  def refine_params
    params.permit(:instructions)
  end
end
