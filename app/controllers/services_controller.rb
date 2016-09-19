class ServicesController < ApplicationController
	def create
		@garment = Garment.find(params[:garment_id])
		@service = @garment.services.create(service_params)
		redirect_to garment_path(@garment)
	end

	def destroy
		@garment = Garment.find(params[:garment_id])
		@service = @garment.services.find(params[:id])
		@service.destroy
		redirect_to garment_path(@garment)
	end

	private
	def service_params
		params.require(:service).permit(:name, :cost)
	end
end
