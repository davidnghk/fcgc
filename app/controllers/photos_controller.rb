class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :load_photoable
  #before_action :set_photo
  # GET /photos
  def index
    @pagy, @photos = pagy(Photo.all)
  end

  # GET /photos/1
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  def create
    if params[:images]
      params[:images].each do |img|
        @photoable.photos.create(image: img, category: 0)
      end
    end
    @photo = @photoable.photos
    redirect_back(fallback_location: root_path)
  end


  def create_general
    if params[:images]
      params[:images].each do |img|
        @photoable.photos.create(image: img, category: 0)
      end
    end
    @photo = @photoable.photos   
    #redirect_to :back
    redirect_back(fallback_location: root_path)
  end

  def create_after
    # @order = Order.find(params[:order_id])
    if params[:images]
      params[:images].each do |img|
        @photoable.photos.create(image: img, category: 2)
      end 
    end
    # @photo = @order.photos
    @photo = @photoable.photos   
    redirect_to :back
  end

  def create_before 
    if params[:images]
      params[:images].each do |img|
        @photoable.photos.create(image: img, category: 1)
      end
    end
    @photo = @photoable.photos   
    redirect_to :back
    # redirect_back(fallback_location: request.referer, notice: "Saved..")
  end

  # PATCH/PUT /photos/1
  def update
    if @photo.update(photo_params)
      redirect_to @photo, notice: 'Photo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    @photos = @photoable.photos
    redirect_to @photoable, notice: 'Photo was successfully updated.'
    # respond_to :js
  end

  def switch_printable
    @photo = Photo.find(params[:id])
    @photo.toggle!(:is_printable)
    @photos = @photoable.photos
    respond_to :js
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def load_photoable
      # after adding I18n
      master, master_id = request.path.split('/')[2, 3]
      #master, master_id = request.path.split('/')[1,2]
      @photoable = master.singularize.classify.constantize.find(master_id)
      master_type = master.singularize.classify.constantize
    end

    # Only allow a trusted parameter "white list" through.
    def photo_params
      params.require(:photo).permit(:photoable_id, :photoable_type, :category, :image)
    end
end
