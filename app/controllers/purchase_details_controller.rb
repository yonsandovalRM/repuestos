class PurchaseDetailsController < ApplicationController
  before_action :set_purchase_detail, only: [:show, :edit, :update, :destroy]

  # GET /purchase_details
  # GET /purchase_details.json
  def index
    @purchase_details = PurchaseDetail.all
  end

  # GET /purchase_details/1
  # GET /purchase_details/1.json
  def show
  end

  # GET /purchase_details/new
  def new
    @purchase_detail = PurchaseDetail.new
  end

  # GET /purchase_details/1/edit
  def edit
  end

  # POST /purchase_details
  # POST /purchase_details.json
  def create
    @purchase_detail = PurchaseDetail.new(purchase_detail_params)

    respond_to do |format|
      if @purchase_detail.save
        format.html { redirect_to :back, location: @purchase_detail, notice: 'Purchase detail was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_detail }
      else
        format.html { render :new }
        format.json { render json: @purchase_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_details/1
  # PATCH/PUT /purchase_details/1.json
  def update
    respond_to do |format|
      if @purchase_detail.update(purchase_detail_params)
        format.html { redirect_to :back, location: @purchase_detail, notice: 'Purchase detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_detail }
      else
        format.html { render :edit }
        format.json { render json: @purchase_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_details/1
  # DELETE /purchase_details/1.json
  def destroy
    @purchase_detail.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Purchase detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_detail
      @purchase_detail = PurchaseDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_detail_params
      params.require(:purchase_detail).permit(:article_id, :stock, :stock_store, :pin, :purchase_id)
    end
end
