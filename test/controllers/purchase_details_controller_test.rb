# == Schema Information
#
# Table name: purchase_details
#
#  id          :integer          not null, primary key
#  article_id  :integer
#  stock       :float
#  stock_store :float
#  pin         :integer
#  purchase_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_purchase_details_on_article_id   (article_id)
#  index_purchase_details_on_purchase_id  (purchase_id)
#

require 'test_helper'

class PurchaseDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_detail = purchase_details(:one)
  end

  test "should get index" do
    get purchase_details_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_detail_url
    assert_response :success
  end

  test "should create purchase_detail" do
    assert_difference('PurchaseDetail.count') do
      post purchase_details_url, params: { purchase_detail: { article_id: @purchase_detail.article_id, pin: @purchase_detail.pin, purchase_id: @purchase_detail.purchase_id, stock: @purchase_detail.stock, stock_store: @purchase_detail.stock_store } }
    end

    assert_redirected_to purchase_detail_url(PurchaseDetail.last)
  end

  test "should show purchase_detail" do
    get purchase_detail_url(@purchase_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_detail_url(@purchase_detail)
    assert_response :success
  end

  test "should update purchase_detail" do
    patch purchase_detail_url(@purchase_detail), params: { purchase_detail: { article_id: @purchase_detail.article_id, pin: @purchase_detail.pin, purchase_id: @purchase_detail.purchase_id, stock: @purchase_detail.stock, stock_store: @purchase_detail.stock_store } }
    assert_redirected_to purchase_detail_url(@purchase_detail)
  end

  test "should destroy purchase_detail" do
    assert_difference('PurchaseDetail.count', -1) do
      delete purchase_detail_url(@purchase_detail)
    end

    assert_redirected_to purchase_details_url
  end
end
