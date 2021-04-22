require "application_system_test_case"

class PlasmaDonorsTest < ApplicationSystemTestCase
  setup do
    @plasma_donor = plasma_donors(:one)
  end

  test "visiting the index" do
    visit plasma_donors_url
    assert_selector "h1", text: "Plasma Donors"
  end

  test "creating a Plasma donor" do
    visit plasma_donors_url
    click_on "New Plasma Donor"

    fill_in "Alternate phone", with: @plasma_donor.alternate_phone
    fill_in "Blood group", with: @plasma_donor.blood_group
    fill_in "City", with: @plasma_donor.city_id
    fill_in "Deleted at", with: @plasma_donor.deleted_at
    check "Fake" if @plasma_donor.fake
    fill_in "Last verified at", with: @plasma_donor.last_verified_at
    fill_in "Name", with: @plasma_donor.name
    check "Old" if @plasma_donor.old
    fill_in "Phone", with: @plasma_donor.phone
    fill_in "Pincode", with: @plasma_donor.pincode
    check "Unavailable" if @plasma_donor.unavailable
    click_on "Create Plasma donor"

    assert_text "Plasma donor was successfully created"
    click_on "Back"
  end

  test "updating a Plasma donor" do
    visit plasma_donors_url
    click_on "Edit", match: :first

    fill_in "Alternate phone", with: @plasma_donor.alternate_phone
    fill_in "Blood group", with: @plasma_donor.blood_group
    fill_in "City", with: @plasma_donor.city_id
    fill_in "Deleted at", with: @plasma_donor.deleted_at
    check "Fake" if @plasma_donor.fake
    fill_in "Last verified at", with: @plasma_donor.last_verified_at
    fill_in "Name", with: @plasma_donor.name
    check "Old" if @plasma_donor.old
    fill_in "Phone", with: @plasma_donor.phone
    fill_in "Pincode", with: @plasma_donor.pincode
    check "Unavailable" if @plasma_donor.unavailable
    click_on "Update Plasma donor"

    assert_text "Plasma donor was successfully updated"
    click_on "Back"
  end

  test "destroying a Plasma donor" do
    visit plasma_donors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plasma donor was successfully destroyed"
  end
end
