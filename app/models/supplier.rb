class Supplier < ApplicationRecord
	def self.total_active
	  	Supplier.where('status = true').count
	end
end
