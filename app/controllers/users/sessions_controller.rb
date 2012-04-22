class Users::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    if session[:url_back]
      temp = session[:url_back]
      session[:url_back] = nil
      return temp
    end
    super(resource)
  end
end
