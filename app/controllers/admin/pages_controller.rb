class Admin::PagesController < Admin::BaseController
  load_resource :survey
  load_resource :page, :through => :survey

  def new
    respond_with(@page)
  end

  def create
    @page.update_attributes(params[:page])
    respond_with(@page, :location => admin_survey_questions_path(@survey))
  end

  def edit
    respond_with(@page)
  end

  def update
    @page.update_attributes(params[:page])
    respond_with(@page, :location => admin_survey_questions_path(@survey))
  end

  def destroy
    @page.destroy
  end
end
