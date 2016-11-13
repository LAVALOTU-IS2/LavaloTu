class OrdersController < ApplicationController
	def show
		@order = Order.find(params[:id])
		@details = @order.order_details
	end
end
