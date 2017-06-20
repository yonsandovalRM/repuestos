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
#  date_doc          :datetime
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

class SalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sale = sales(:one)
  end

  test "should get index" do
    get sales_url
    assert_response :success
  end

  test "should get new" do
    get new_sale_url
    assert_response :success
  end

  test "should create sale" do
    assert_difference('Sale.count') do
      post sales_url, params: { sale: { customer_id: @sale.customer_id, number_doc: @sale.number_doc, observation: @sale.observation, payment_method_id: @sale.payment_method_id, status_payment_id: @sale.status_payment_id, type_document_id: @sale.type_document_id, user_id: @sale.user_id } }
    end

    assert_redirected_to sale_url(Sale.last)
  end

  test "should show sale" do
    get sale_url(@sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_sale_url(@sale)
    assert_response :success
  end

  test "should update sale" do
    patch sale_url(@sale), params: { sale: { customer_id: @sale.customer_id, number_doc: @sale.number_doc, observation: @sale.observation, payment_method_id: @sale.payment_method_id, status_payment_id: @sale.status_payment_id, type_document_id: @sale.type_document_id, user_id: @sale.user_id } }
    assert_redirected_to sale_url(@sale)
  end

  test "should destroy sale" do
    assert_difference('Sale.count', -1) do
      delete sale_url(@sale)
    end

    assert_redirected_to sales_url
  end
end
