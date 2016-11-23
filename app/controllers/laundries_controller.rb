class LaundriesController < ApplicationController

 #before_action :authenticate_user!
 def index
  redirect_to not_authorized_path if !current_user.try(:Admin?)
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

def destroy
  @laundry = Laundry.find(params[:id])
  @laundry.destroy
  redirect_to laundries_path, notice: 'Laundry deleted '
end

def show
 gon.laundry_id = params[:id]
 #gon.rabl "app/views/products/index.json.rabl", as: "products"
end

def show_laundry
  gon.laundry_id = params[:id]
end

def generated_orders
  @laundry = Laundry.find(current_user.laundry_id)
  @orders = Order.where("laundry_id = ? AND status = ?", @laundry.id, "Generated")
end

def edit
  @laundry = Laundry.find(params[:id])
end

def update
  @laundry = Laundry.find(params[:id])
  if @laundry.update(laundry_params)
    if policy(current_user).index?
      redirect_to @laundry
    else
      redirect_to ladmin_path(current_user)
    end
  else
    render 'edit'
  end
end

def deliver
  @order = Order.find(params[:id])
  @laundry = Laundry.find(current_user.laundry_id)
end

def send_order_mail
  @order = Order.find(params[:id])
  #@delivery = Delivery.where(order_id: @order.id)
  #@delivery.deliverer_id = params[:deliverer]
  #@delivery.save
  SendOrderMailer.send_order(@order).deliver
  redirect_to generated_orders_path
end

def calculator
  @laundry = Laundry.find(params[:id])
  @services = @laundry.services
end

def laundry_admin
  @user = User.find(params[:id])
  @laundry = Laundry.find(@user.laundry_id)
end

def laundry_deliverers
  @user = User.find(params[:id])
  @laundry = Laundry.find(@user.laundry_id)
end

private

def laundry_params
  params.require(:laundry).permit(:name, :address, :phone, :score)
end

end
