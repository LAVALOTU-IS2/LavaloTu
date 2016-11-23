class OrdersController < ApplicationController
	def show
		if policy(current_user).laundry?
			@laundry = Laundry.find(current_user.laundry_id)
		end
		@order = Order.find(params[:id])
		@details = @order.order_details
	end

	def create
		@order = Order.new(pickup_date: params[:order][:pickup_date], total_cost: params[:order][:total_cost], user_id: current_user.id, laundry_id: params[:order][:laundry_id], status: "Generated")
		@order.save
		params[:details].each do |index, detail|
			@garment = Garment.where(name: params[:details][index][:garment])
			@order.order_details.create(garment_id: @garment[0].id, 
				service_name: params[:details][index][:service], 
				quantity: params[:details][index][:quantity], 
				unit_cost: params[:details][index][:unit_cost], 
				cost: params[:details][index][:cost])
			@order.deliveries.create(direction: 0, place_id: params[:place])
		end
		if request.xhr? # test if the request is an AJAX call
			render js: "document.location = '#{current_orders_path}'", notice: "Your order was successfully created"
		else
			redirect_to current_orders_path, notice: 'Parser was successfully created.' 
		end
	end
end
