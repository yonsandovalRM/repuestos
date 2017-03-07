class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @sale_detail = SaleDetail.new
    
    if @sale.sale_details.count > 0
      @sale.sale_details.each do |detail|
        @tot_neto = @tot_neto.to_i + ((detail.stock.to_i + detail.stock_store.to_i) * detail.pou.to_i)
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
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
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
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
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
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
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
      params.require(:sale).permit(:user_id, :payment_method_id, :number_doc, :type_document_id, :status_payment_id, :observation, :customer_id)
    end
end
