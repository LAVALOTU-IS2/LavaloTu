class ConfirmationsController < Devise::ConfirmationsController
	def after_confirmation_path_for(resource_name, resource)
		sign_in(resource)
   		profile_path # redirect_to is not necessary
	end
end