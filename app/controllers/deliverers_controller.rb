class DeliverersController < ApplicationController
	def new
		@deliverer= Deliverer.new
	end

	def show
    @order = Order.find(params[:id])
		@laundry = Laundry.find(@order.laundry_id)
		@deliverer = @laundry.deliverers.find(params[:id])				
	end

 	 def index
	    @laundry = Laundry.find(params[:laundry_id])
	    @deliverer = @laundry.deliverers.all
 	 end

  def create
    @laundry = Laundry.find(params[:laundry_id])
    @deliverer = @laundry.deliverers.create(deliverer_params)
    if @deliverer.save
      redirect_to laundry_deliverers_path(@laundry)
    else
      render 'new'
    end
  end

  
  def destroy
    @laundry = Laundry.find(params[:laundry_id])
    @deliverer = @laundry.deliverers.find(params[:id])
    @deliverer.destroy
    redirect_to laundry_deliverers_path(@laundry)
  end

  private
    def deliverer_params
      params.require(:deliverer).permit(:name, :email, :phone)
    end
end
