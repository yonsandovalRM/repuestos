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

require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
