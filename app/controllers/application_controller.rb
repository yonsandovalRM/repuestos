class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :contadores
  before_action :configure_permitted_parameters, if: :devise_controller?
  include CanCan::ControllerAdditions

  def contadores
	  @proveedores   = Supplier.total_active
	  @articulos     = Article.total_active
	  @compras       = Purchase.total_active
    @ventas        = Sale.total_active
	  @clientes      = Customer.total_active
    @cotizaciones  = Quotation.total_active

	end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to :back, notice: exception.message }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
