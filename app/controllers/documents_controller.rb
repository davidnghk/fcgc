class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy, :start, 
    :cancel, :complete, :approve]

  def cancel
    @document.cancel!
    redirect_to @document 
  end

  def start
    @document.start!
    redirect_to @document 
  end

  def complete
    @document.complete!
    redirect_to @document 
  end

  def approve
    @document.approve!
    redirect_to @document 
  end

    # GET /documents
  def index
    @search = Document.where(team: current_team).search(params[:q])
    @pagy, @documents = pagy(@search.result)
    #@products = @search.result
    #@pagy, @documents = pagy(Document.where(team: current_team))
  end

  # GET /documents/1
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit 
  def edit
  end

  # POST /documents
  def create
    @document = Document.new(document_params.merge(team: current_team))

    if @document.save
      redirect_to @document, notice: 'Document was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /documents/1
  def update
    if @document.update(document_params)
      redirect_to @document, notice: 'Document was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /documents/1
  def destroy
    @document.destroy
    redirect_to documents_url, notice: 'Document was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def document_params
      params.require(:document).permit(:team_id, :code, :user_ref, :description, 
        :aasm_state, uploadfiles: [])
    end
end
