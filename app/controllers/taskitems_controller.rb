class TaskitemsController < ApplicationController
  before_action :set_taskitem, only: [:show, :edit, :update, :destroy]

  # GET /taskitems
  def index
    @pagy, @taskitems = pagy(Taskitem.all)
  end

  # GET /taskitems/1
  def show
  end

  # GET /taskitems/new
  def new
    @taskitem = Taskitem.new(task_id: params[:task_id],)
  end

  # GET /taskitems/1/edit 
  def edit
  end

  # POST /taskitems
  def create
    @taskitem = Taskitem.new(taskitem_params)

    if @taskitem.save
      redirect_to @taskitem.task, notice: 'Taskitem was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /taskitems/1
  def update
    if @taskitem.update(taskitem_params)
      redirect_to @taskitem, notice: 'Taskitem was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /taskitems/1
  def destroy
    @taskitem.destroy
    redirect_to @taskitem.task, notice: 'Taskitem was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taskitem
      @taskitem = Taskitem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def taskitem_params
      params.require(:taskitem).permit(:task_id, :workitem_id, :model, :serial_number, :rating, :remarks)
    end
end
