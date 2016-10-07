class Api::V1::GarmentsController < ApiController
  
  respond_to :json
  
  def index
    respond_with Garment.all 
    #@garments = Garment.all.paginate(:page => params[:page], :per_page => 25)
    #render json: @garments, meta: {pagination:
    #                                {per_page:25,
    #                                 total_pages: @garments.total_pages,
    #                                 total_objects: @garments.total_entries,
    #                                 next_page: @garments.next_page}}, status: 200 
  end

  def show
    respond_with Garment.find(params[:id])
  end

  def create 
    @garment = Garment.new(garment_params)
    if @garment.save
      head 201, content_type: "text/html"
    else
      render json: {errors: @garment.errors}, status: 400
    end
  end

  def update
    @garment = Garment.find(params[:id])
    if @garment.update(garment_params)
      head 200, content_type: "text/html"
    else
      render json: {errors: @garment.errors}, status: 400
    end
  end

  def destroy
    @garment = Garment.find(params[:id])
    @garment.destroy!
    if @garment.errors.any?
      render json: {errors: @garment.errors}, status: 500
    else
      head 204, content_type: "text/html"
    end
  end

  private
    def garment_params
      params.require(:post).permit(:name,:description)
    end
end
