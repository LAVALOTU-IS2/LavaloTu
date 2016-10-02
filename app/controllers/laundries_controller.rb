class LaundriesController < ApplicationController
	def index
		@laundries = Laundry.all
	end

	def new

	end

	def create
		@laundry = Laundry.create(laundry_params)
		redirect_to @laundry
	end

	def show
		@laundry = Laundry.find(params[:id])
	end

	def destroy
		@laundry = Laundry.find(params[:id])
		@laundry.destroy
  		redirect_to laundries_path, notice: 'Lavanderia Eliminada '
	end

	private
	def laundry_params
		params.require(:laundry).permit(:name, :address, :phone, :score)
	end
end
