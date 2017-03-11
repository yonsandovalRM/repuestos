# == Schema Information
#
# Table name: purchases
#
#  id                :integer          not null, primary key
#  supplier_id       :integer
#  number_doc        :string
#  type_document_id  :integer
#  date_doc          :datetime
#  observation       :string
#  status            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  payment_method_id :integer
#  status_payment    :string
#  status_payment_id :integer
#
# Indexes
#
#  index_purchases_on_payment_method_id  (payment_method_id)
#  index_purchases_on_status_payment_id  (status_payment_id)
#  index_purchases_on_supplier_id        (supplier_id)
#  index_purchases_on_type_document_id   (type_document_id)
#

class Purchase < ApplicationRecord
  belongs_to :supplier
  belongs_to :type_document
  belongs_to :payment_method
  belongs_to :status_payment
  has_many   :purchase_details, :dependent => :destroy
  accepts_nested_attributes_for :purchase_details, reject_if: :all_blank, allow_destroy: true


	def self.total_active
  	Purchase.all.count
	end

	
end
