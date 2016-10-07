class Api::V1::ServicesController < ApplicationController
  respond_to :json

  def index
    respond_with Service.all
  end

  def show
    respond_with Service.find(params[:id])
  end
end