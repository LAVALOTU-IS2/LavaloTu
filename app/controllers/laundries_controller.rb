class LaundriesController < ApplicationController
	def index
		@laundries = Laundry.all
	end

	def new
		@laundry = Laundry.new
	end

	def create
		@laundry = Laundry.new(laundry_params)
		
		if @laundry.save
			redirect_to @laundry
		else
			render 'new'
		end
	end

	def update
		@laundry = Laundry.find(params[:id])

		if @laundry.update(laundry_params)
			redirect_to @laundry
		else
			render 'edit'
		end
	end

	def edit
		@laundry = Laundry.find(params[:id])
	end

	def destroy
		@laundry = Laundry.find(params[:id])
		@laundry.destroy
		redirect_to laundries_path, notice: 'Lavanderia Eliminada '
	end

	def show
		@laundry = Laundry.find(params[:id])
		@garments = @laundry.garments
	end

	def calculator
		@laundry = Laundry.find(params[:id])
		@services = @laundry.services
	end

	private
	def laundry_params
		params.require(:laundry).permit(:name, :address, :phone, :score)
	end

	
end
