require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get customers_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_url
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post customers_url, params: { customer: { address: @customer.address, b_activity: @customer.b_activity, b_address: @customer.b_address, b_commune: @customer.b_commune, b_email: @customer.b_email, b_name: @customer.b_name, b_phone: @customer.b_phone, b_rut: @customer.b_rut, city: @customer.city, commune: @customer.commune, email: @customer.email, name: @customer.name, observation: @customer.observation, phone2: @customer.phone2, phone: @customer.phone, run: @customer.run, status: @customer.status } }
    end

    assert_redirected_to customer_url(Customer.last)
  end

  test "should show customer" do
    get customer_url(@customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_url(@customer)
    assert_response :success
  end

  test "should update customer" do
    patch customer_url(@customer), params: { customer: { address: @customer.address, b_activity: @customer.b_activity, b_address: @customer.b_address, b_commune: @customer.b_commune, b_email: @customer.b_email, b_name: @customer.b_name, b_phone: @customer.b_phone, b_rut: @customer.b_rut, city: @customer.city, commune: @customer.commune, email: @customer.email, name: @customer.name, observation: @customer.observation, phone2: @customer.phone2, phone: @customer.phone, run: @customer.run, status: @customer.status } }
    assert_redirected_to customer_url(@customer)
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete customer_url(@customer)
    end

    assert_redirected_to customers_url
  end
end
