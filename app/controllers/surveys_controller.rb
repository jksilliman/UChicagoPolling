class SurveysController < ApplicationController
  before_filter :authenticate_and_redirect!, :ensure_info!, :load_survey, :only => [:show, :update]
  before_filter :load_surveys, :only => [:index]

  def index
    respond_with(@surveys)
  end

  def show
    page_num = params[:page_num] || @response.last_page
    page_num = page_num.to_i

    if page_num == 0
      render 'before_survey'
      return
    elsif page_num > @survey.pages.count
      render 'after_survey'
      return
    end

    @page = @survey.pages.find_by_order(page_num)
    @page = @survey.pages.first unless @page
    @questions = @page.questions
    @errors = []
    
    respond_with(@survey)
  end

  def update
    page_num = params[:page_num].to_i
    @page = @survey.pages.find_by_order(page_num)
    
    @errors = []
    
    if @page
      @questions = @page.questions
    else
      @questions = []
    end

    unless params[:question].is_a? Array
      q_answers = params[:question]
    else
      q_answers = []
    end

    @questions.each do |q|
      answer = q_answers[q.id.to_s]
      if q.valid_answer?(answer)
        @response.modify_answer(q.id, answer)
      else
        @errors << q.id
      end  

    end
  
    next_page_dir = (params[:commit] == "Next") ? 1 : -1 
    next_page = page_num + next_page_dir
    if @errors.empty?
      if @survey.pages.count == page_num
        @response.is_complete = true
      end
      @response.last_page = page_num + 1
      @response.save
      redirect_to survey_path(@survey, :page_num => next_page)
    elsif next_page_dir == -1
      @response.save
      redirect_to survey_path(@survey, :page_num => next_page)
    else
      render :show
    end
  end

  private
  def load_surveys
    @surveys = Survey.find_all_by_is_published(true)
  end

  def load_survey
    @survey = Survey.find(params[:id])
    @response = current_user.survey_responses.find_by_survey_id(params[:id])
    if not @response
      @response = current_user.survey_responses.create(:survey_id => params[:id])
    end
  end


end
