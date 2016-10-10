class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters , if: :devise_controller?
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    profile_path
  end
private
	def user_not_authorized
		flash[:notice] = "El usuario no esta autorizado para esta acción"
		redirect_to(request.referrer || root_path)
	end
  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :lastname, :password, :phone])
  end
end
