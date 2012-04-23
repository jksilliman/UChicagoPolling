class ApplicationController < ActionController::Base
  protect_from_forgery

  respond_to :html

  def authenticate_and_redirect_user!
    authenticate_and_redirect!
  end

  def authenticate_and_redirect!
    return true if current_user
    if request.get?
      session[:url_back] = request.fullpath
    else
      session[:url_back] = request.referer
    end
    authenticate_user!
    session[:url_back] = nil
  end



  def ensure_info!
    if current_user.needs_info
      redirect_to edit_info_path
    end
  end

end
