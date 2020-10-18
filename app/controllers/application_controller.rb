class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 #protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :redirect_www
  
#  def redirect_www
#   @url = request.url
#   if @url.include?('www.')
#     @url = @url.delete('www.')
#     redirect_to("#{@url}")
#   end
#  end

 def after_sign_in_path_for(resource)
  pages_show_path
 end
    
 private
  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end

 protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

end
