class GarmentsController < ApplicationController
	#before_action :authenticate_user!
	def new
		@garment = Garment.new
	end

	def show
		@garment = Garment.find(params[:id])
		@laundry = Laundry.find(params[:laundry_id])
		@service_laundry = Service.where(laundry_id: @laundry.id, garment_id: @garment.id)
	end

	def create
		@garment = Garment.new(garment_params)
		@laundry = Laundry.find(params[:laundry_id])
		if @garment.save
			redirect_to laundry_garment_path(@laundry,@garment)
		else
			render 'new'
		end
	end

	def edit
		@garment = Garment.find(params[:id])
		@laundry = Laundry.find(params[:laundry_id])
	end

	def index
		if policy(current_user).index? or policy(current_user).laundry?
			@garments = Garment.all
			@laundry = Laundry.find(params[:laundry_id])
		else
			redirect_to static_pages_not_authorized_path
		end
	end

	def update
		@garment = Garment.find(params[:id])
		@laundry = Laundry.find(params[:laundry_id])
		if @garment.update(garment_params)
			redirect_to laundry_garments_path
		else
			render 'edit'
		end
	end
	
	def destroy
		@garment = Garment.find(params[:id])
		@laundry = Laundry.find(params[:laundry_id])
		@garment.destroy

		redirect_to laundry_garments_path
	end

	private 
	def garment_params
		params.require(:garment).permit(:name, :description)
	end

end
