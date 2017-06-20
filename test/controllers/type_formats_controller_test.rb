# == Schema Information
#
# Table name: type_formats
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TypeFormatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_format = type_formats(:one)
  end

  test "should get index" do
    get type_formats_url
    assert_response :success
  end

  test "should get new" do
    get new_type_format_url
    assert_response :success
  end

  test "should create type_format" do
    assert_difference('TypeFormat.count') do
      post type_formats_url, params: { type_format: { name: @type_format.name } }
    end

    assert_redirected_to type_format_url(TypeFormat.last)
  end

  test "should show type_format" do
    get type_format_url(@type_format)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_format_url(@type_format)
    assert_response :success
  end

  test "should update type_format" do
    patch type_format_url(@type_format), params: { type_format: { name: @type_format.name } }
    assert_redirected_to type_format_url(@type_format)
  end

  test "should destroy type_format" do
    assert_difference('TypeFormat.count', -1) do
      delete type_format_url(@type_format)
    end

    assert_redirected_to type_formats_url
  end
end
