class ServicesController < ApplicationController
	#before_action :authenticate_user!
	def create
		@garment = Garment.find(params[:garment_id])
		@laundry = Laundry.find(params[:laundry_id])
		@service = @laundry.services.create(service_params)
		redirect_to laundry_garment_path(@laundry,@garment)
	end

	def destroy
		@garment = Garment.find(params[:garment_id])
		@laundry = Laundry.find(params[:laundry_id])
		@service = @laundry.services.find(params[:id])
		@service.destroy
		redirect_to laundry_garment_path(@laundry,@garment)
	end

	def show
		@laundry=Laundry.find(params[:laundry_id])
		@service = @laundry.service.find(params[:id])
	end
	private
	
	def service_params
		params.require(:service).permit(:name, :cost, :garment_id, :laundry_id)
	end
end
