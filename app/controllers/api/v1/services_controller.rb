class Api::V1::ServicesController < ApplicationController
	respond_to :json
	def index
		@services = []
		nombre = params[:services]

		nombre.each do |key, value|
			temp = value.strip!
			temp.split(" ").each do |value|
				@services<< Service.where("laundry_id = ? AND garment_id = ?", key.to_i , value.to_i).first 	
			end
			
			p "#{key} - #{value}"
		end
		respond_with @services	
	end

	def show
		respond_with Service.find(params[:id])
	end
end