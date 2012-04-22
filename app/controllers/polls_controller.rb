class PollsController < ApplicationController
  before_filter :authenticate_and_redirect_user!, :ensure_info!
  
  def index
    @polls = Poll.all
  end

  def show
    @poll = Poll.find(params[:id])
  end

end
