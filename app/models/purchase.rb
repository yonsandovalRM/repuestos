class Purchase < ApplicationRecord
  belongs_to :supplier
  belongs_to :type_document
  belongs_to :payment_method
  has_many   :purchase_details, :dependent => :destroy
  accepts_nested_attributes_for :purchase_details, reject_if: :all_blank, allow_destroy: true


	def self.total_active
  	Purchase.all.count
	end

	
end
