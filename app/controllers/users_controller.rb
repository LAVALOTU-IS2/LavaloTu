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

	def laundries_login

	end
	def create
	end

	def new
	end

	def index
		#redirect_to not_authorized_path if !current_user.try(:Admin?)
		@users=User.all
		authorize @users
	end

	def show
    	@user = User.find(params[:id])
  	end

  	def destroyUser
  		@user = User.find(params[:id])
  		@user.destroy
  		redirect_to users_path, notice: 'Usuario eliminado correctamente.'
  	end

	def prices
		
	end

	def orders
		@laundries = Laundry.all
		@hash = Gmaps4rails.build_markers(@laundries) do |laundry, marker|
		  marker.lat laundry.latitude
		  marker.lng laundry.longitude
		  content = 	'<div class="content">' +
						'<div class="image" align="center">' +
						'<img alt="Laundry Icon" title="Laundry Icon" class="img-responsive" src="/assets/ironing-board.png" />' +
						'</div>' +
		  				'<h4 class="name">' + laundry.name + '</h4>' +
		  				'<span class="address">' + laundry.address + '</span>' + '</br>' +
		  				'<span class="phone">Phone: ' + laundry.phone.to_s + '</span>' +
		  				'<h5 class="score">Score: ' + laundry.score.to_s + '</h5>' +
		  				'<a class="mask" href="/laundries/' + laundry.id.to_s + '">' +
      						'See prices </a>' +
						'</div>'
		  marker.infowindow content
		end
	end

	def profile
	end
	 
	def update
		puts user_params
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
