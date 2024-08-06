class WorkitemsController < ApplicationController
  before_action :set_workitem, only: [:show, :edit, :update, :destroy]

  # GET /workitems
  def index
    @pagy, @workitems = pagy(Workitem.all)
  end

  # GET /workitems/1
  def show
  end

  # GET /workitems/new
  def new
    @workitem = Workitem.new(work_id: params[:work])
  end

  # GET /workitems/1/edit
  def edit
  end

  # POST /workitems
  def create
    @workitem = Workitem.new(workitem_params)

    if @workitem.save
      redirect_to @workitem, notice: 'Workitem was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /workitems/1
  def update
    if @workitem.update(workitem_params)
      redirect_to @workitem, notice: 'Workitem was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /workitems/1
  def destroy
    @workitem.destroy
    redirect_to @workitem.work, notice: 'Workitem was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workitem
      @workitem = Workitem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def workitem_params
      params.require(:workitem).permit(:work_id, :code, :name, :local_name)
    end
end
