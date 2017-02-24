class Purchase < ApplicationRecord
  belongs_to :supplier
  belongs_to :type_document

  	def self.total_active
	  	Purchase.all.count
	end

	
end
