class Supplier < ApplicationRecord
  	validates :rut, rut: true

	def self.total_active
	  	Supplier.where('status = true').count
	end
end
