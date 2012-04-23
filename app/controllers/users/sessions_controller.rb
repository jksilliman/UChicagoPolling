class Users::SessionsController < Devise::SessionsController

  def create
    puts "#{resource_name} #{controller_path}"
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_with resource, :location => redirect_location(resource_name, resource)
  end

  def after_sign_in_path_for(resource)
    if session[:url_back]
      temp = session[:url_back]
      session[:url_back] = nil
      return temp
    else
      return super(resource)
    end
  end
end
