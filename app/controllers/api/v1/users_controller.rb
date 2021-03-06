class Api::V1::UsersController < ApiController
	respond_to :json
	def index
		respond_with User.all 
	end
	def reloadUser
		if @user
			render json: @user, status: 200
		end
	end

	def show
		respond_with User.find(params[:id])
	end

	def create 
		@user = User.new(user_params)
		if @user.save
		  head 201, content_type: "text/html"
		else
		  render json: {errors: @user.errors}, status: 400
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		  head 200, content_type: "text/html"
		else
		  render json: {errors: @user.errors}, status: 400
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy!
		if @user.errors.any?
		  render json: { errors: @user.errors }, status: 500
		else
		  head 204, content_type: "text/html"
		end
	end

	def login
		if params.key?('email') && params.key?('password')
			user = User.find_by_email(params['email'])
			if user != nil
				if user.valid_password?(params['password'])
					render json: user, status:200
				else
					render json: {errors: "Invalid password"}, status: 422
				end
			else
				render json: {errors: "Invalid email"}, status: 422
			end
		else
			render json: {errors: "The request is wrong"}, status: 422
		end
	end

	private
	def user_params
	  params.require(:user).permit(:name,:lastname, :phone, :email)
	end

end
