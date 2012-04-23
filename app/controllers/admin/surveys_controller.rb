class Admin::SurveysController < Admin::BaseController
  load_and_authorize_resource

  def index
    @surveys = Survey.all
  end

  def new
    respond_with(@survey)
  end

  def create
    @survey.update_attributes(params[:survey])
    respond_with(@survey, :location => new_admin_survey_page_path(@survey))
  end

  def edit
    respond_with(@survey)
  end

  def update
    @survey.update_attributes(params[:survey])
    respond_with(@survey, :location => admin_surveys_path)
  end

  def destroy
    @survey.destroy
  end
end
