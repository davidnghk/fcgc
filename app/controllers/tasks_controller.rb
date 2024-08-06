class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, 
    :askRequestInfo, :ask, :reject, :approve, :assign, :askWorkInfo, :acknowledge, 
    :start, :complete, :appraise, :cancel, :report]

  def cancel
    @task.cancel!
    redirect_to @task 
  end

  def askRequestInfo
    @task.askRequestInfo!
    redirect_to @task 
  end

  def ask
    @task.ask!
    redirect_to @task 
  end

  def reject
    @task.reject!
    redirect_to @task 
  end

  def approve
    @task.approve!
    redirect_to @task 
  end

  def assign
    @task.assign!
    redirect_to @task 
  end

  def askWorkInfo
    @task.askWorkInfo!
    redirect_to @task 
  end

  def acknowledge
    @task.acknowledge!
    redirect_to @task 
  end

  def start
    @task.start!
    redirect_to @task 
  end

  def complete
    @task.complete!
    @task.end_date ||= Date.current
    @task.save
    redirect_to @task 
  end

  def appraise
    @task.appraise!
    redirect_to @task 
  end

  # GET /tasks
#  def index
#    @pagy, @tasks = pagy(Task.includes(:work, :customer, :team, :user).where(team: current_team))
#    @team_works = Work.where(team: current_team)
#    @team_customers = Customer.where(team: current_team)
#  end


  def index
    @tasks = Task.latest.includes(:user, :team, :work).where(team: current_team) 
    #if params[:commit] == "Search" or  params[:commit] == "Report"
    #  @search = Task.where(team: current_team).search(params[:q])
    #  @pagy, @tasks = pagy(@search.result)
    #else
    #  @pagy, @tasks = pagy(Task.includes(:work, :customer, :team, :user).where(team: current_team))
    #  @team_works = Work.where(team: current_team)
    #end 
  end

  def search
    @q = Task.where(team: current_team).search(params[:q])
    @results = @q.result
    #@results = @results.where(" start_date >= ? ", Date.today ) unless params[:q]
    @tasks = @results
    #@pagy, @tasks = pagy(@results)
    @team_works = Work.where(team: current_team)

    respond_to do |format|
      format.html
    end
  end

  # GET /tasks/1
  def show
    @photos = @task.photos
    respond_to do |format|
      format.html {}
      format.pdf do
        html = render_to_string(template: 'tasks/show.pdf.erb', layout: 'layouts/application.pdf.erb')
        pdf = WickedPdf.new.pdf_from_string(html)
        send_data(pdf, filename: 'task.pdf', type: 'application/pdf', disposition: :attachment)
      end
    end
  end

  # GET /tasks/new
  def new
    @task = Task.new(parent_id: params[:parent_id])
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params.merge(team: current_team, user: current_user))
    @task.start_date ||= Date.current
    @task.due_date ||= Date.tomorrow
    @task.requesting_team ||= current_team
    @task.managing_team   ||= current_team
    @task.operating_team  ||= current_team
    @task.work_id  ||= 1

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:team_id, :user_id, :parent_id, :work_id, :customer_id, :aasm_state,
        :request_team_id, :managing_team_id, :operating_team_id, 
        :user_ref, :parent_id, :our_ref, :heading, :locatin, :start_date, :due_date, :end_date, photos: [])
    end
end
