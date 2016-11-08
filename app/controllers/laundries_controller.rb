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
 gon.laundry_id = params[:id]
 #gon.rabl "app/views/products/index.json.rabl", as: "products"
end

def show_laundry
  #@laundry = Laundry.find(params[:id])
  gon.laundry_id = params[:id]
end
def calculator
  @laundry = Laundry.find(params[:id])
  @services = @laundry.services
end

def laundry_admin
end
private
def laundry_params
  params.require(:laundry).permit(:name, :address, :phone, :score)
end


end
