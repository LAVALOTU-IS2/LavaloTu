class PlacesController < ApplicationController

def new
  end

  def create
    @user = User.find(params[:user_id])
    @place = @user.places.create(place_params)
    redirect_to users_path(@user)
  end
 
  private
    def place_params
      params.require(:place).permit(:name, :address)
    end
end
