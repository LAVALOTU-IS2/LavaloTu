class UsersController < ApplicationController
	before_action :authenticate_user!
	def finish_signup
	    if request.patch? && params[:user] # Revisa si el request es de tipo patch, es decir, llenaron el formulario y lo ingresaron
	    	@user = User.find(params[:id])

	    	if @user.update(user_params)
	    		sign_in(@user, :bypass => true)
	    		redirect_to profile_path, notice: 'Hemos guardado tu email correctamente.'
	    	else
	    		@show_errors = true
	    	end
	    end
	end

	def create
	end

	def new
	end

	def index
		#redirect_to static_pages_not_authorized_path if !current_user.try(:Admin?)
		@users=User.all
		authorize @users
	end

	def show
    	@user = User.find(params[:id])
  	end

  	def destroyUser
  		@user = User.find(params[:id])
  		@user.destroy
  		redirect_to users_path, notice: 'Usario eliminado correctamente.'
  	end

	def prices
		
	end

	def orders
		
		@laundries = Laundry.all
	end

	def profile
	end
	 
	def update
	  @user = User.find(params[:id])
	  if @user.update(user_params)
	   redirect_to profile_path
	 else
	  render 'edit'
	 end
	end
	def edit
	  @user = User.find(params[:id])
	end

	private
	def user_params
	    accessible = [ :id, :name, :email, :lastname, :phone ] # extend with your own params
	    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
	    params.require(:user).permit(accessible)
	end
end
