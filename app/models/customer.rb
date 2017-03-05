class Customer < ApplicationRecord
	validates :run, rut: true
	validates :b_rut, rut: true, if: 'b_rut.present?'
	
	def self.total_active
	  	Customer.all.count
	end
end
