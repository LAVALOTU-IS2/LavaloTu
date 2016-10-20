class GarmentsController < ApplicationController
	#before_action :authenticate_user!
	def new
		@garment = Garment.new
	end

	def show
		@garment = Garment.find(params[:id])
	end

	def create
		@garment = Garment.new(garment_params)
		if @garment.save
			redirect_to @garment
		else
			render 'new'
		end
	end

	def edit
		@garment = Garment.find(params[:id])
	end

	def index
		redirect_to static_pages_not_authorized_path if !current_user.try(:Admin?)
		@garments = Garment.all
	end

	def update
		@garment = Garment.find(params[:id])
		
		if @garment.update(garment_params)
			redirect_to @garment
		else
			render 'edit'
		end
	end
	
	def destroy
		@garment = Garment.find(params[:id])
		@garment.destroy

		redirect_to garments_path
	end

	private 
	def garment_params
		params.require(:garment).permit(:name, :description)
	end

end
