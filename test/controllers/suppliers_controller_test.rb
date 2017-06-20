# == Schema Information
#
# Table name: suppliers
#
#  id         :integer          not null, primary key
#  rut        :string
#  bname      :string
#  address    :string
#  commune    :string
#  city       :string
#  activity   :string
#  phone      :string
#  status     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string
#

require 'test_helper'

class SuppliersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @supplier = suppliers(:one)
  end

  test "should get index" do
    get suppliers_url
    assert_response :success
  end

  test "should get new" do
    get new_supplier_url
    assert_response :success
  end

  test "should create supplier" do
    assert_difference('Supplier.count') do
      post suppliers_url, params: { supplier: { activity: @supplier.activity, address: @supplier.address, bname: @supplier.bname, city: @supplier.city, comunne: @supplier.comunne, phone: @supplier.phone, rut: @supplier.rut, status: @supplier.status } }
    end

    assert_redirected_to supplier_url(Supplier.last)
  end

  test "should show supplier" do
    get supplier_url(@supplier)
    assert_response :success
  end

  test "should get edit" do
    get edit_supplier_url(@supplier)
    assert_response :success
  end

  test "should update supplier" do
    patch supplier_url(@supplier), params: { supplier: { activity: @supplier.activity, address: @supplier.address, bname: @supplier.bname, city: @supplier.city, comunne: @supplier.comunne, phone: @supplier.phone, rut: @supplier.rut, status: @supplier.status } }
    assert_redirected_to supplier_url(@supplier)
  end

  test "should destroy supplier" do
    assert_difference('Supplier.count', -1) do
      delete supplier_url(@supplier)
    end

    assert_redirected_to suppliers_url
  end
end
