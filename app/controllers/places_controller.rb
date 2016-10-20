class PlacesController < ApplicationController
  before_action :authenticate_user!
  def new
  end
  def index
    @user = User.find(params[:user_id])
    @place = @user.places.all
  end

  def create
    @user = User.find(params[:user_id])
    @place = @user.places.create(place_params)
    redirect_to profile_path
    #if @place.save
    #  redirect_to users_path(@user)
    #else
    #  render 'new'
    #end
  end

  def show
    @user = User.find(params[:user_id])
    @place = @user.places.find(params[:id])
  end
  def destroy
    @user = User.find(params[:user_id])
    @place = @user.places.find(params[:id])
    @place.destroy
    redirect_to users_path(@user)
  end

  private
    def place_params
      params.require(:place).permit(:name, :address)
    end
end
