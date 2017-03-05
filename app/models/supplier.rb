class Supplier < ApplicationRecord
  	validates :rut, rut: true
  	has_many :purchases

	def self.total_active
	  	Supplier.where('status = true').count
	end
end
