require "test_helper"

class PlasmaDonorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plasma_donor = plasma_donors(:one)
  end

  test "should get index" do
    get plasma_donors_url
    assert_response :success
  end

  test "should get new" do
    get new_plasma_donor_url
    assert_response :success
  end

  test "should create plasma_donor" do
    assert_difference('PlasmaDonor.count') do
      post plasma_donors_url, params: { plasma_donor: { alternate_phone: @plasma_donor.alternate_phone, blood_group: @plasma_donor.blood_group, city_id: @plasma_donor.city_id, deleted_at: @plasma_donor.deleted_at, fake: @plasma_donor.fake, last_verified_at: @plasma_donor.last_verified_at, name: @plasma_donor.name, old: @plasma_donor.old, phone: @plasma_donor.phone, pincode: @plasma_donor.pincode, unavailable: @plasma_donor.unavailable } }
    end

    assert_redirected_to plasma_donor_url(PlasmaDonor.last)
  end

  test "should show plasma_donor" do
    get plasma_donor_url(@plasma_donor)
    assert_response :success
  end

  test "should get edit" do
    get edit_plasma_donor_url(@plasma_donor)
    assert_response :success
  end

  test "should update plasma_donor" do
    patch plasma_donor_url(@plasma_donor), params: { plasma_donor: { alternate_phone: @plasma_donor.alternate_phone, blood_group: @plasma_donor.blood_group, city_id: @plasma_donor.city_id, deleted_at: @plasma_donor.deleted_at, fake: @plasma_donor.fake, last_verified_at: @plasma_donor.last_verified_at, name: @plasma_donor.name, old: @plasma_donor.old, phone: @plasma_donor.phone, pincode: @plasma_donor.pincode, unavailable: @plasma_donor.unavailable } }
    assert_redirected_to plasma_donor_url(@plasma_donor)
  end

  test "should destroy plasma_donor" do
    assert_difference('PlasmaDonor.count', -1) do
      delete plasma_donor_url(@plasma_donor)
    end

    assert_redirected_to plasma_donors_url
  end
end
