require "application_system_test_case"

class HospitalBedsTest < ApplicationSystemTestCase
  setup do
    @hospital_bed = hospital_beds(:one)
  end

  test "visiting the index" do
    visit hospital_beds_url
    assert_selector "h1", text: "Hospital Beds"
  end

  test "creating a Hospital bed" do
    visit hospital_beds_url
    click_on "New Hospital Bed"

    fill_in "Address", with: @hospital_bed.address
    fill_in "Alternate phone", with: @hospital_bed.alternate_phone
    fill_in "Beds", with: @hospital_bed.beds
    fill_in "City", with: @hospital_bed.city_id
    fill_in "Contact name", with: @hospital_bed.contact_name
    check "Fake" if @hospital_bed.fake
    fill_in "Hospital name", with: @hospital_bed.hospital_name
    fill_in "Icu beds", with: @hospital_bed.icu_beds
    fill_in "Last verified at", with: @hospital_bed.last_verified_at
    check "Old" if @hospital_bed.old
    fill_in "Phone", with: @hospital_bed.phone
    check "Unavailable" if @hospital_bed.unavailable
    click_on "Create Hospital bed"

    assert_text "Hospital bed was successfully created"
    click_on "Back"
  end

  test "updating a Hospital bed" do
    visit hospital_beds_url
    click_on "Edit", match: :first

    fill_in "Address", with: @hospital_bed.address
    fill_in "Alternate phone", with: @hospital_bed.alternate_phone
    fill_in "Beds", with: @hospital_bed.beds
    fill_in "City", with: @hospital_bed.city_id
    fill_in "Contact name", with: @hospital_bed.contact_name
    check "Fake" if @hospital_bed.fake
    fill_in "Hospital name", with: @hospital_bed.hospital_name
    fill_in "Icu beds", with: @hospital_bed.icu_beds
    fill_in "Last verified at", with: @hospital_bed.last_verified_at
    check "Old" if @hospital_bed.old
    fill_in "Phone", with: @hospital_bed.phone
    check "Unavailable" if @hospital_bed.unavailable
    click_on "Update Hospital bed"

    assert_text "Hospital bed was successfully updated"
    click_on "Back"
  end

  test "destroying a Hospital bed" do
    visit hospital_beds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hospital bed was successfully destroyed"
  end
end
