class SaleDetailsController < ApplicationController
  before_action :set_sale_detail, only: [:show, :edit, :update, :destroy]

  # GET /sale_details
  # GET /sale_details.json
  def index
    @sale_details = SaleDetail.all
  end

  # GET /sale_details/1
  # GET /sale_details/1.json
  def show
  end

  # GET /sale_details/new
  def new
    @sale_detail = SaleDetail.new
  end

  def setStocks(action, article, sale)

    if action == 'vende'
      stock       = article.stock.to_i - sale.stock.to_i
      stock_store = article.stock_store.to_i - sale.stock_store.to_i
    elsif action == 'elimina'
      stock       = article.stock.to_i + sale.stock.to_i
      stock_store = article.stock_store.to_i + sale.stock_store.to_i
    end

    article.update_attributes(:stock => stock, :stock_store => stock_store)
  end

  # GET /sale_details/1/edit
  def edit
  end

  # POST /sale_details
  # POST /sale_details.json
  def create
    @sale_detail = SaleDetail.new(sale_detail_params)
    unless  @sale_detail.stock.present?
       @sale_detail.stock = 0
    end
    unless  @sale_detail.stock_store.present?
       @sale_detail.stock_store = 0
    end
    article = Article.find(@sale_detail.article_id)
    setStocks('vende', article, @sale_detail)
    respond_to do |format|
      if @sale_detail.save
        format.html { redirect_to :back, location: @sale_detail }
        format.json { render :show, status: :created, location: @sale_detail }
      else
        format.html { redirect_to :back, location: @sale_detail.errors}
        format.json { render json: @sale_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sale_details/1
  # PATCH/PUT /sale_details/1.json
  # def update
  #   respond_to do |format|
  #     if @sale_detail.update(sale_detail_params)
  #       format.html { redirect_to @sale_detail, notice: 'Sale detail was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @sale_detail }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @sale_detail.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /sale_details/1
  # DELETE /sale_details/1.json
  def destroy
    @sale_detail.destroy

    article = Article.find(@sale_detail.article_id)
    setStocks('elimina', article, @sale_detail)

    respond_to do |format|
      format.html { redirect_to :back, notice: 'Eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_detail
      @sale_detail = SaleDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_detail_params
      params.require(:sale_detail).permit(:article_id, :stock, :stock_store, :pou, :discount, :sale_id)
    end
end
