class QuotationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quotation, only: [:show, :edit, :update, :destroy]

  # GET /quotations
  # GET /quotations.json
  def index
    @quotations = Quotation.all.last(30)
  end

  # GET /quotations/1
  # GET /quotations/1.json
  def show
    @quotation_detail = QuotationDetail.new
    
    if @quotation.quotation_details.count > 0
      @quotation.quotation_details.each do |detail|
        @tot_neto = @tot_neto.to_i + (detail.stock.to_f * detail.pou.to_i)
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
      format.pdf { render template: 'quotations/voucher', pdf: 'comprobante', layout: 'pdf.haml',:page_height => '20cm', :page_width => '8cm', margin:  {   top: '2mm', bottom: '2mm', left: '2mm', right: '2mm' }}
    end
  end

  def convert_to_quotation 
    #raise params[:quotation_id].to_yaml
    current_sale = Sale.find(params[:quotation_id])
    @quotation = Quotation.new
    @quotation.user_id           = current_sale.user_id
    @quotation.payment_method_id = current_sale.payment_method_id
    @quotation.number_doc        = current_sale.number_doc
    @quotation.type_document_id  = current_sale.type_document_id
    @quotation.status_payment_id = current_sale.status_payment_id
    @quotation.observation       = current_sale.observation
    @quotation.customer_id       = current_sale.customer_id
    @quotation.save
   
    detalle = SaleDetail.where(sale_id: current_sale.id)
   

    #suma el stock descontado en la venta y agrega el detalle a la cotizacion
    detalle.each do |det|
      article = Article.find(det.article_id)
      article.stock = article.stock.to_f + det.stock.to_f 
      article.stock_store = article.stock_store.to_f + det.stock_store.to_f
      article.save
      quotation_new_detail = QuotationDetail.new
      quotation_new_detail.quotation_id = @quotation.id
      quotation_new_detail.article_id = det.article_id
      quotation_new_detail.stock = det.stock.to_f + det.stock_store.to_f
      quotation_new_detail.pou = det.pou.to_i
      quotation_new_detail.save
    end

    #elimina venta
    current_sale.destroy

    respond_to do |format|
      format.html {redirect_to action: "show", id: @quotation.id}
    end
    

  end

  # GET /quotations/new
  def new
    @quotation = Quotation.new
  end

  # GET /quotations/1/edit
  def edit
  end

  # POST /quotations
  # POST /quotations.json
  def create
    @quotation = Quotation.new(quotation_params)

    respond_to do |format|
      if @quotation.save
        format.html { redirect_to @quotation, notice: 'Quotation was successfully created.' }
        format.json { render :show, status: :created, location: @quotation }
      else
        format.html { render :new }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotations/1
  # PATCH/PUT /quotations/1.json
  def update
    respond_to do |format|
      if @quotation.update(quotation_params)
        format.html { redirect_to @quotation, notice: 'Quotation was successfully updated.' }
        format.json { render :show, status: :ok, location: @quotation }
      else
        format.html { render :edit }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotations/1
  # DELETE /quotations/1.json
  def destroy
    @quotation.destroy
    respond_to do |format|
      format.html { redirect_to quotations_url, notice: 'Quotation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation
      @quotation = Quotation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quotation_params
      params.require(:quotation).permit(:user_id, :payment_method_id, :number_doc, :type_document_id, :status_payment_id, :observation, :customer_id)
    end
end
