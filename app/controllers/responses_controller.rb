class ResponsesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_poll
  respond_to :html, :json


  def create
    @response = @poll.responses.create(params[:response])
    respond_with(@response, :location => poll_path(@poll))
  end

  def update
  end

  def destroy
  end

  private

  def load_poll
    @poll = Poll.find(params[:poll_id])
  end
end
