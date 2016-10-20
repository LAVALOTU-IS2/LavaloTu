class RegistrationsController < Devise::RegistrationsController

  def account_update_params
    devise_parameter_sanitizer.sanitize(:account_update)
  end
  private
  def account_update_params
    params.require(:user).permit(:name, :lastname,:phone, :email, :password, :password_confirmation, :current_password)
  end


  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
    def after_update_path_for(resource)
      profile_path
    end

    
	
end
