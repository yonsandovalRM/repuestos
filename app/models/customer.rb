class Customer < ApplicationRecord
	validates :run, rut: true
	validates :b_rut, rut: true, if: 'b_rut.present?'
	has_many  :sale

	def self.total_active
	  	Customer.all.count
	end
end
