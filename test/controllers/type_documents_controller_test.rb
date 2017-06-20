# == Schema Information
#
# Table name: type_documents
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TypeDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_document = type_documents(:one)
  end

  test "should get index" do
    get type_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_type_document_url
    assert_response :success
  end

  test "should create type_document" do
    assert_difference('TypeDocument.count') do
      post type_documents_url, params: { type_document: { name: @type_document.name } }
    end

    assert_redirected_to type_document_url(TypeDocument.last)
  end

  test "should show type_document" do
    get type_document_url(@type_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_document_url(@type_document)
    assert_response :success
  end

  test "should update type_document" do
    patch type_document_url(@type_document), params: { type_document: { name: @type_document.name } }
    assert_redirected_to type_document_url(@type_document)
  end

  test "should destroy type_document" do
    assert_difference('TypeDocument.count', -1) do
      delete type_document_url(@type_document)
    end

    assert_redirected_to type_documents_url
  end
end
