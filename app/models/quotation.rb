# == Schema Information
#
# Table name: quotations
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  payment_method_id :integer
#  number_doc        :string
#  type_document_id  :integer
#  status_payment_id :integer
#  observation       :string
#  customer_id       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_quotations_on_customer_id        (customer_id)
#  index_quotations_on_payment_method_id  (payment_method_id)
#  index_quotations_on_status_payment_id  (status_payment_id)
#  index_quotations_on_type_document_id   (type_document_id)
#  index_quotations_on_user_id            (user_id)
#

class Quotation < ApplicationRecord
  belongs_to :user
  belongs_to :payment_method
  belongs_to :type_document
  belongs_to :status_payment
  belongs_to :customer
  has_many   :quotation_details, :dependent => :destroy
  def self.total_active
  	Quotation.all.count
  end
end
