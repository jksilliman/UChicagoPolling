class InfoController < ApplicationController
  before_filter :authenticate_and_redirect_user!
  
  respond_to :html

  def edit
  end

  def update
    current_user.assign_attributes(params[:user], :as => :info)

    if current_user.valid?
      current_user.needs_info = false
      current_user.save
    end
    respond_with(current_user, :location =>  root_url)
  end 


end
