class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :contadores

  def contadores
	  @proveedores = Supplier.total_active
	  @articulos   = Article.total_active
	  @compras     = Purchase.total_active
	end
end
