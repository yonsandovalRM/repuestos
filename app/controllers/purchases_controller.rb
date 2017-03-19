class PurchasesController < ApplicationController
  before_action :authenticate_user!
  autocomplete :supplier, :bname
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
    @stock = PurchaseDetail.sum('stock')
    @stock_store = PurchaseDetail.sum('stock_store')
    @mascomprados = PurchaseDetail.select("purchase_details.article_id, COUNT(article_id) AS t_count").group("purchase_details.article_id").order("t_count DESC").limit(2)
    

  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show

    @purchase_detail = PurchaseDetail.new
    
    if @purchase.purchase_details.count > 0
      @purchase.purchase_details.each do |detail|
        @tot_neto = @tot_neto.to_i + ((detail.stock.to_i + detail.stock_store.to_i) * detail.pin.to_i)
      end

      @tot_iva = @tot_neto * 0.19
      @tot_total = @tot_neto + @tot_iva
    else
      @tot_iva = 0
      @tot_neto = 0
      @tot_total = 0
    end

    respond_to do |format|
      format.html
      format.pdf { render template: 'purchases/voucher', pdf: 'comprobante', layout: 'pdf.haml',:page_height => '20cm', :page_width => '8cm', margin:  {   top: '2mm', bottom: '2mm', left: '2mm', right: '2mm' }}
    end
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit
  end

  

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)
    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase, notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:supplier_id, :number_doc, :type_document_id, :date_doc, :observation, :status, :payment_method_id, :status_payment_id )
    end
end
