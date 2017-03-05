require 'test_helper'

class StatePaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @state_payment = state_payments(:one)
  end

  test "should get index" do
    get state_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_state_payment_url
    assert_response :success
  end

  test "should create state_payment" do
    assert_difference('StatePayment.count') do
      post state_payments_url, params: { state_payment: { name: @state_payment.name } }
    end

    assert_redirected_to state_payment_url(StatePayment.last)
  end

  test "should show state_payment" do
    get state_payment_url(@state_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_state_payment_url(@state_payment)
    assert_response :success
  end

  test "should update state_payment" do
    patch state_payment_url(@state_payment), params: { state_payment: { name: @state_payment.name } }
    assert_redirected_to state_payment_url(@state_payment)
  end

  test "should destroy state_payment" do
    assert_difference('StatePayment.count', -1) do
      delete state_payment_url(@state_payment)
    end

    assert_redirected_to state_payments_url
  end
end
