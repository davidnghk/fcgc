class IconsController < ApplicationController
  before_action :set_icon, only: [:show, :edit, :update, :destroy]

  # GET /icons
  def index
    @pagy, @icons = pagy(Icon.all)
  end

  # GET /icons/1
  def show
  end

  # GET /icons/new
  def new
    @icon = Icon.new
  end

  # GET /icons/1/edit
  def edit
  end

  # POST /icons
  def create
    @icon = Icon.new(icon_params)

    if @icon.save
      redirect_to @icon, notice: 'Icon was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /icons/1
  def update
    if @icon.update(icon_params)
      redirect_to @icon, notice: 'Icon was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /icons/1
  def destroy
    @icon.destroy
    redirect_to icons_url, notice: 'Icon was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_icon
      @icon = Icon.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def icon_params
      params.require(:icon).permit(:code, :name, :local_name)
    end
end
