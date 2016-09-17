class Api::V1::GarmentsController < ApplicationController
  
  respond_to :json
  
  def index
    respond_with Garment.all 
  end

  def show
    respond_with Garment.find(params[:id])
  end

  private
    def garment_params
      params.require(:post).permit(:name,:description)
    end
end
