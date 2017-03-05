class TypeDocumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_type_document, only: [:show, :edit, :update, :destroy]

  # GET /type_documents
  # GET /type_documents.json
  def index
    @type_documents = TypeDocument.all
  end

  # GET /type_documents/1
  # GET /type_documents/1.json
  def show
  end

  # GET /type_documents/new
  def new
    @type_document = TypeDocument.new
    respond_to do |format|
      format.html { render :new }
      format.js {  }
    end
  end

  # GET /type_documents/1/edit
  def edit
  end

  # POST /type_documents
  # POST /type_documents.json
  def create
    @type_document = TypeDocument.new(type_document_params)

    respond_to do |format|
      if @type_document.save
        format.html { redirect_to @type_document, notice: 'Type document was successfully created.' }
        format.json { render :show, status: :created, location: @type_document }
        format.js   { render "show.js.erb", location: @type_document }
      else
        format.html { render :new }
        format.json { render json: @type_document.errors, status: :unprocessable_entity }
        format.js   { render :new }
      end
    end
  end

  # PATCH/PUT /type_documents/1
  # PATCH/PUT /type_documents/1.json
  def update
    respond_to do |format|
      if @type_document.update(type_document_params)
        format.html { redirect_to @type_document, notice: 'Type document was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_document }
      else
        format.html { render :edit }
        format.json { render json: @type_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_documents/1
  # DELETE /type_documents/1.json
  def destroy
    @type_document.destroy
    respond_to do |format|
      format.html { redirect_to type_documents_url, notice: 'Type document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_document
      @type_document = TypeDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_document_params
      params.require(:type_document).permit(:name)
    end
end
