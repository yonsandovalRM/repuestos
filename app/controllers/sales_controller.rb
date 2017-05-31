class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.order(created_at: :desc).last(30)
    @masvendidos = SaleDetail.select("sale_details.article_id, COUNT(article_id) AS t_count").group("sale_details.article_id").order("t_count DESC").limit(3)
    
  end
   def find_fordate
    
    
    if params[:desde].present? and params[:hasta].present?
      desde = Date.parse(params[:desde]).strftime('%Y-%m-%d')
      hasta = Date.parse(params[:hasta]).strftime('%Y-%m-%d')
      @sales = Sale.order(created_at: :desc).where(created_at: desde..hasta)
      @masvendidos = SaleDetail.select("sale_details.article_id, COUNT(article_id) AS t_count").group("sale_details.article_id").order("t_count DESC").limit(3)
    
    
      respond_to do |format|
        format.html { render "index" }
      end
    else
      @sales = Sale.order(created_at: :desc)
      @masvendidos = SaleDetail.select("sale_details.article_id, COUNT(article_id) AS t_count").group("sale_details.article_id").order("t_count DESC").limit(3)
      respond_to do |format|
        format.html { render "index" }
      end
    end
   
    # if @customer_search.present?
    #   format.js { render "search.js.erb", location: @customer_search }
    # else
    #   format.js { render "create_customer.js.erb", location: @customer_search }
    # end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @sale_detail = SaleDetail.new
    @destacados = Article.all
    if @sale.sale_details.count > 0
      @sale.sale_details.each do |detail|
        @tot_neto = @tot_neto.to_i + ((detail.stock.to_f + detail.stock_store.to_f) * detail.pou.to_i)
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
      format.pdf { render template: 'sales/voucher', pdf: 'comprobante', layout: 'pdf.haml',:page_height => '20cm', :page_width => '8cm', margin:  {   top: '2mm', bottom: '2mm', left: '2mm', right: '2mm' }}
    end
  end

  def convert_to_sale
    #datos de cotizacion a venta
    current_quotation = Quotation.find(params[:sale_id])
    @sale = Sale.new
    @sale.user_id           = current_quotation.user_id
    @sale.payment_method_id = current_quotation.payment_method_id
    @sale.number_doc        = current_quotation.number_doc
    @sale.type_document_id  = current_quotation.type_document_id
    @sale.status_payment_id = current_quotation.status_payment_id
    @sale.observation       = current_quotation.observation
    @sale.customer_id       = current_quotation.customer_id
    @sale.save
   
    detalle = QuotationDetail.where(quotation_id: current_quotation.id)
   

    #suma el stock descontado en la venta y agrega el detalle a la cotizacion
    detalle.each do |det|
      article = Article.find(det.article_id)
      article.stock = article.stock.to_f - det.stock.to_f 
      article.save
      sale_new_detail = SaleDetail.new
      sale_new_detail.sale_id = @sale.id
      sale_new_detail.article_id = det.article_id
      sale_new_detail.stock = det.stock.to_f
      sale_new_detail.pou = det.pou.to_i
      sale_new_detail.save
    end

    #elimina cotización
    # current_quotation.destroy

    respond_to do |format|
      format.html {redirect_to action: "show", id: @sale.id}
    end
    

  end


  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)
    @sale.user_id = current_user.id
    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Venta actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Venta eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:user_id, :payment_method_id, :number_doc, :type_document_id, :status_payment_id, :observation, :customer_id, :date_doc)
    end
end
