class WebController < ApplicationController
  def index
  	respond_to do |format|
  		format.html { render layout: "web"}
  	end
  end
  def tienda
  	respond_to do |format|
  		format.html { render layout: "web"}
  	end
  end
  def contacto
  	respond_to do |format|
  		format.html { render layout: "web"}
  	end
  end
  def carro
  	respond_to do |format|
  		format.html { render layout: "web"}
  	end
  end
end
