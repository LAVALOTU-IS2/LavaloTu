class LaundriesController < ApplicationController
  def index
    @laundries = Laundry.all
  end

  def show
    @laundry = Laundry.find(params[:id])
    @garments = @laundry.garments
  end

  def calculator
    @laundry = Laundry.find(params[:id])
    @services = @laundry.services
  end

end
