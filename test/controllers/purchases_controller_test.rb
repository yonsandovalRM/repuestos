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

class PurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase = purchases(:one)
  end

  test "should get index" do
    get purchases_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_url
    assert_response :success
  end

  test "should create purchase" do
    assert_difference('Purchase.count') do
      post purchases_url, params: { purchase: { date_doc: @purchase.date_doc, number_doc: @purchase.number_doc, observation: @purchase.observation, status: @purchase.status, supplier_id: @purchase.supplier_id, type_document_id: @purchase.type_document_id } }
    end

    assert_redirected_to purchase_url(Purchase.last)
  end

  test "should show purchase" do
    get purchase_url(@purchase)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_url(@purchase)
    assert_response :success
  end

  test "should update purchase" do
    patch purchase_url(@purchase), params: { purchase: { date_doc: @purchase.date_doc, number_doc: @purchase.number_doc, observation: @purchase.observation, status: @purchase.status, supplier_id: @purchase.supplier_id, type_document_id: @purchase.type_document_id } }
    assert_redirected_to purchase_url(@purchase)
  end

  test "should destroy purchase" do
    assert_difference('Purchase.count', -1) do
      delete purchase_url(@purchase)
    end

    assert_redirected_to purchases_url
  end
end
