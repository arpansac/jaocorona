require "test_helper"

class OxygenSuppliersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @oxygen_supplier = oxygen_suppliers(:one)
  end

  test "should get index" do
    get oxygen_suppliers_url
    assert_response :success
  end

  test "should get new" do
    get new_oxygen_supplier_url
    assert_response :success
  end

  test "should create oxygen_supplier" do
    assert_difference('OxygenSupplier.count') do
      post oxygen_suppliers_url, params: { oxygen_supplier: { alternate_phone: @oxygen_supplier.alternate_phone, city_id: @oxygen_supplier.city_id, fake: @oxygen_supplier.fake, last_verified_at: @oxygen_supplier.last_verified_at, name: @oxygen_supplier.name, old: @oxygen_supplier.old, phone: @oxygen_supplier.phone, unavailable: @oxygen_supplier.unavailable } }
    end

    assert_redirected_to oxygen_supplier_url(OxygenSupplier.last)
  end

  test "should show oxygen_supplier" do
    get oxygen_supplier_url(@oxygen_supplier)
    assert_response :success
  end

  test "should get edit" do
    get edit_oxygen_supplier_url(@oxygen_supplier)
    assert_response :success
  end

  test "should update oxygen_supplier" do
    patch oxygen_supplier_url(@oxygen_supplier), params: { oxygen_supplier: { alternate_phone: @oxygen_supplier.alternate_phone, city_id: @oxygen_supplier.city_id, fake: @oxygen_supplier.fake, last_verified_at: @oxygen_supplier.last_verified_at, name: @oxygen_supplier.name, old: @oxygen_supplier.old, phone: @oxygen_supplier.phone, unavailable: @oxygen_supplier.unavailable } }
    assert_redirected_to oxygen_supplier_url(@oxygen_supplier)
  end

  test "should destroy oxygen_supplier" do
    assert_difference('OxygenSupplier.count', -1) do
      delete oxygen_supplier_url(@oxygen_supplier)
    end

    assert_redirected_to oxygen_suppliers_url
  end
end
