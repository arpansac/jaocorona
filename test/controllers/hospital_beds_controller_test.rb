require "test_helper"

class HospitalBedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hospital_bed = hospital_beds(:one)
  end

  test "should get index" do
    get hospital_beds_url
    assert_response :success
  end

  test "should get new" do
    get new_hospital_bed_url
    assert_response :success
  end

  test "should create hospital_bed" do
    assert_difference('HospitalBed.count') do
      post hospital_beds_url, params: { hospital_bed: { address: @hospital_bed.address, alternate_phone: @hospital_bed.alternate_phone, beds: @hospital_bed.beds, city_id: @hospital_bed.city_id, contact_name: @hospital_bed.contact_name, fake: @hospital_bed.fake, hospital_name: @hospital_bed.hospital_name, icu_beds: @hospital_bed.icu_beds, last_verified_at: @hospital_bed.last_verified_at, old: @hospital_bed.old, phone: @hospital_bed.phone, unavailable: @hospital_bed.unavailable } }
    end

    assert_redirected_to hospital_bed_url(HospitalBed.last)
  end

  test "should show hospital_bed" do
    get hospital_bed_url(@hospital_bed)
    assert_response :success
  end

  test "should get edit" do
    get edit_hospital_bed_url(@hospital_bed)
    assert_response :success
  end

  test "should update hospital_bed" do
    patch hospital_bed_url(@hospital_bed), params: { hospital_bed: { address: @hospital_bed.address, alternate_phone: @hospital_bed.alternate_phone, beds: @hospital_bed.beds, city_id: @hospital_bed.city_id, contact_name: @hospital_bed.contact_name, fake: @hospital_bed.fake, hospital_name: @hospital_bed.hospital_name, icu_beds: @hospital_bed.icu_beds, last_verified_at: @hospital_bed.last_verified_at, old: @hospital_bed.old, phone: @hospital_bed.phone, unavailable: @hospital_bed.unavailable } }
    assert_redirected_to hospital_bed_url(@hospital_bed)
  end

  test "should destroy hospital_bed" do
    assert_difference('HospitalBed.count', -1) do
      delete hospital_bed_url(@hospital_bed)
    end

    assert_redirected_to hospital_beds_url
  end
end
