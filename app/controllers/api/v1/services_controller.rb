class Api::V1::ServicesController < ApiController
	respond_to :json
	def index
		@services = []
		nombre = params[:services]

		nombre.each do |key, value|
			temp = value.strip!
			temp.split(" ").each do |value|
				@services<< Service.where("laundry_id = ? AND garment_id = ?", key.to_i , value.to_i).first 	
			end
			
			p "#{key} - #{value}"
		end
		respond_with @services	
	end
	def show
		respond_with Service.find(params[:id])
	end
	def create 
    @service = Service.new(service_params)
    if @service.save
      head 201, content_type: "text/html"
    else
      render json: {errors: @service.errors}, status: 400
    end
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      head 200, content_type: "text/html"
    else
      render json: {errors @service.errors}, status: 400
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy!
    if @service.errors.any?
      render json: {errors @service.errors}, status: 500
    else
      head 204, content_type: "text/html"
    end
  end

  private
    def service_params
      params.require(:service).permit(:name,:cost,:garment_id)
    end
end