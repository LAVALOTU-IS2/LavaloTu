class Api::V1::LaundriesController < ApplicationController
	respond_to :json

	def index
		respond_with Laundry.all 
	end

	def show
		respond_with Laundry.find(params[:id])
	end
end
