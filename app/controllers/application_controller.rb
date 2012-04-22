class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_and_redirect_user!
    session[:url_back] = request.fullpath
    authenticate_user!
  end

  def ensure_info!
    if current_user.needs_info
      redirect_to edit_info_path
    end
  end

end
