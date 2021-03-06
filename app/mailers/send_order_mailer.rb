class SendOrderMailer < ApplicationMailer
	def send_order(order)
	    @order = order
	    @details = @order.order_details
	    @user = User.find(@order.user_id)
	    @laundry = Laundry.find(@order.laundry_id)
	    @delivery = Delivery.where(order_id: @order.id)
	    @deliverer = Deliverer.find(@delivery[0].deliverer_id)
	    @place = Place.find(@delivery[0].place_id)
	    mail(to: @user.email, subject: 'New order confirmed')
  	end
end
