# == Schema Information
#
# Table name: sales
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
#  index_sales_on_customer_id        (customer_id)
#  index_sales_on_payment_method_id  (payment_method_id)
#  index_sales_on_status_payment_id  (status_payment_id)
#  index_sales_on_type_document_id   (type_document_id)
#  index_sales_on_user_id            (user_id)
#

require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
