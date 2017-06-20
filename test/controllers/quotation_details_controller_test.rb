# == Schema Information
#
# Table name: quotation_details
#
#  id           :integer          not null, primary key
#  article_id   :integer
#  stock        :float
#  pou          :integer
#  discount     :integer
#  quotation_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_quotation_details_on_article_id    (article_id)
#  index_quotation_details_on_quotation_id  (quotation_id)
#

require 'test_helper'

class QuotationDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quotation_detail = quotation_details(:one)
  end

  test "should get index" do
    get quotation_details_url
    assert_response :success
  end

  test "should get new" do
    get new_quotation_detail_url
    assert_response :success
  end

  test "should create quotation_detail" do
    assert_difference('QuotationDetail.count') do
      post quotation_details_url, params: { quotation_detail: { article_id: @quotation_detail.article_id, discount: @quotation_detail.discount, pou: @quotation_detail.pou, quotation_id: @quotation_detail.quotation_id, stock: @quotation_detail.stock } }
    end

    assert_redirected_to quotation_detail_url(QuotationDetail.last)
  end

  test "should show quotation_detail" do
    get quotation_detail_url(@quotation_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_quotation_detail_url(@quotation_detail)
    assert_response :success
  end

  test "should update quotation_detail" do
    patch quotation_detail_url(@quotation_detail), params: { quotation_detail: { article_id: @quotation_detail.article_id, discount: @quotation_detail.discount, pou: @quotation_detail.pou, quotation_id: @quotation_detail.quotation_id, stock: @quotation_detail.stock } }
    assert_redirected_to quotation_detail_url(@quotation_detail)
  end

  test "should destroy quotation_detail" do
    assert_difference('QuotationDetail.count', -1) do
      delete quotation_detail_url(@quotation_detail)
    end

    assert_redirected_to quotation_details_url
  end
end
