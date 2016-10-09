class Api::V1::LaundriesController < ApplicationController
  respond_to :json

  def index
    respond_with Laundry.all
  end

  def show
    @laundry = Laundry.find(params[:id])
    #@services = @laundry.services.order(name: :desc)
    @services = @laundry.services.where(name: "Washed And Drying")
    respond_with @services
  end
end
