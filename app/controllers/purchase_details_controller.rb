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
    #raise @purchase_detail.to_yaml
    article = Article.find(@purchase_detail.article_id)
    updateStock(article, @purchase_detail.stock, @purchase_detail.stock_store)

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

    article = Article.find(@purchase_detail.article_id)
    deleteStock(article, @purchase_detail.stock, @purchase_detail.stock_store)

    respond_to do |format|
      if @purchase_detail.update(purchase_detail_params)
        updateStock(article, @purchase_detail.stock, @purchase_detail.stock_store)
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
    article = Article.find(@purchase_detail.article_id)
    deleteStock(article, @purchase_detail.stock, @purchase_detail.stock_store)

    @purchase_detail.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Purchase detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def updateStock(article, stock, stock_store)
    updated_stock       = article.stock + stock.to_i 
    updated_stock_store  = article.stock_store + stock_store.to_i 
    article.update_attributes(:stock => updated_stock, :stock_store => updated_stock_store)
  end

  def deleteStock(article, stock, stock_store)
    updated_stock       = article.stock - stock.to_i 
    updated_stock_store  = article.stock_store - stock_store.to_i 
    article.update_attributes(:stock => updated_stock, :stock_store => updated_stock_store)
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
