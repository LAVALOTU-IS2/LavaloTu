class Api::V1::LaundriesController < ApiController
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

	def create 
    @laundry = Laundry.new(laundry_params)
    if @laundry.save
      head 201, content_type: "text/html"
    else
      render json: {errors: @laundry.errors}, status: 400
    end
  end

  def update
    @laundry = Laundry.find(params[:id])
    if @laundry.update(laundry_params)
      head 200, content_type: "text/html"
    else
      render json: {errors: @laundry.errors}, status: 400
    end
  end

  def destroy
    @laundry = Laundry.find(params[:id])
    @laundry.destroy!
    if @laundry.errors.any?
      render json: {errors: @laundry.errors}, status: 500
    else
      head 204, content_type: "text/html"
    end
  end

  private
    def laundry_params
      params.require(:laundry).permit(:name,:address, :phone, :score)
    end
end
