require 'test_helper'

class SearchCustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_customer_index_url
    assert_response :success
  end

end
