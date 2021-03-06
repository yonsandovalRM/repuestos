class SuppliersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  # GET /suppliers
  # GET /suppliers.json
  def index
    @suppliers = Supplier.all.last(30)
    respond_to do |format|
      format.html { render :index }
      format.js {  }
    end
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
  end
  def search_supplier
    @supplier_search = Supplier.find(params[:supplier_id])
    respond_to do |format|
      format.js { render "search.js.erb", location: @supplier_search }
    end
  end
  # GET /suppliers/new
  def new
    @supplier = Supplier.new
    respond_to do |format|
      format.html { render :new }
      format.js {  }
    end
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to @supplier, notice: 'Proveedor registrado correctamente.' }
        format.json { render :show, status: :created, location: @supplier }
        format.js   { render "show.js.erb", location: @supplier }
      else
        format.html { render :new }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
        format.js   { render :new}
      end
    end
  end

  # PATCH/PUT /suppliers/1
  # PATCH/PUT /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to @supplier, notice: 'Proveedor actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: 'Proveedor eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:rut, :bname, :address, :commune, :city, :activity, :phone, :status, :email)
    end
end
