class TypeFormatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_type_format, only: [:show, :edit, :update, :destroy]

  # GET /type_formats
  # GET /type_formats.json
  def index
    @type_formats = TypeFormat.all
  end

  # GET /type_formats/1
  # GET /type_formats/1.json
  def show
  end

  # GET /type_formats/new
  def new
    @type_format = TypeFormat.new
  end

  # GET /type_formats/1/edit
  def edit
  end

  # POST /type_formats
  # POST /type_formats.json
  def create
    @type_format = TypeFormat.new(type_format_params)

    respond_to do |format|
      if @type_format.save
        format.html { redirect_to @type_format, notice: 'Type format was successfully created.' }
        format.json { render :show, status: :created, location: @type_format }
      else
        format.html { render :new }
        format.json { render json: @type_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_formats/1
  # PATCH/PUT /type_formats/1.json
  def update
    respond_to do |format|
      if @type_format.update(type_format_params)
        format.html { redirect_to @type_format, notice: 'Type format was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_format }
      else
        format.html { render :edit }
        format.json { render json: @type_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_formats/1
  # DELETE /type_formats/1.json
  def destroy
    @type_format.destroy
    respond_to do |format|
      format.html { redirect_to type_formats_url, notice: 'Type format was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_format
      @type_format = TypeFormat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_format_params
      params.require(:type_format).permit(:name)
    end
end
