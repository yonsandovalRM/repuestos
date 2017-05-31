class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all.last(30)
    respond_to do |format|
      format.html { render :index }
      format.js {  }
    end
  end

  def find_customer
    
    if params[:search_run].rut_valid?
      @customer_search = Customer.where(run: params[:search_run]).first
      respond_to do |format|
        if @customer_search.present?
          format.js { render "search.js.erb", location: @customer_search }
        else
          @customer = Customer.new
          format.js { render "create_customer.js.erb", location: @customer }
        end
      end
    else
      respond_to do |format|
        format.js { render "rut_invalid.js.erb" }
      end
    end
    # if @customer_search.present?
    #   format.js { render "search.js.erb", location: @customer_search }
    # else
    #   format.js { render "create_customer.js.erb", location: @customer_search }
    # end
  end

  def search_customer
    @customer_search = Customer.find(params[:customer_id])

    respond_to do |format|
      format.js { render "search.js.erb", location: @customer_search }
    end
  end
  def search_customer_edit
    respond_to do |format|
      format.js { render "edit.js.erb"}
    end
  end
  
  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new

  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    # raise @customer.to_yaml
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Cliente registrado correctamente.' }
        format.json { render :show, status: :created, location: @customer }
        format.js { render "new.js.erb", location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Cliente actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Cliente eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:search_run, :run, :name, :address, :commune, :city, :phone, :phone2, :email, :status, :b_rut, :b_name, :b_address, :b_commune, :b_activity, :b_phone, :b_email)
    end
end
