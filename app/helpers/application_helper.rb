module ApplicationHelper
	def conPuntos(numero)
	    str = numero.to_s.reverse
	    str.gsub!(/([0-9]{3})/,"\\1.")
	    str.gsub(/,$/,"").reverse
	  end
end
