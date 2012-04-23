class Admin::QuestionsController < Admin::BaseController
  load_resource :survey
  load_resource :question, :through => :survey

  def index
    respond_with(@questions)
  end

  def new
    @question.page = @survey.pages.find_by_id(params[:page_id])
    respond_with(@question)
  end

  def create
    @question.update_attributes(params[:question])
    
    @survey.update_numbers

    respond_with(@question, :location => admin_survey_questions_path(@survey))
  end

  def edit
    respond_with(@question)
  end

  def update
    @question.update_attributes(params[:question])
    respond_with(@question, :location => admin_survey_questions_path(@survey))
  end

  def destroy
    @question.destroy
    @survey.update_numbers
  end
end
