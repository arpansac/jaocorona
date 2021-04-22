require "application_system_test_case"

class OxygenSuppliersTest < ApplicationSystemTestCase
  setup do
    @oxygen_supplier = oxygen_suppliers(:one)
  end

  test "visiting the index" do
    visit oxygen_suppliers_url
    assert_selector "h1", text: "Oxygen Suppliers"
  end

  test "creating a Oxygen supplier" do
    visit oxygen_suppliers_url
    click_on "New Oxygen Supplier"

    fill_in "Alternate phone", with: @oxygen_supplier.alternate_phone
    fill_in "City", with: @oxygen_supplier.city_id
    check "Fake" if @oxygen_supplier.fake
    fill_in "Last verified at", with: @oxygen_supplier.last_verified_at
    fill_in "Name", with: @oxygen_supplier.name
    check "Old" if @oxygen_supplier.old
    fill_in "Phone", with: @oxygen_supplier.phone
    check "Unavailable" if @oxygen_supplier.unavailable
    click_on "Create Oxygen supplier"

    assert_text "Oxygen supplier was successfully created"
    click_on "Back"
  end

  test "updating a Oxygen supplier" do
    visit oxygen_suppliers_url
    click_on "Edit", match: :first

    fill_in "Alternate phone", with: @oxygen_supplier.alternate_phone
    fill_in "City", with: @oxygen_supplier.city_id
    check "Fake" if @oxygen_supplier.fake
    fill_in "Last verified at", with: @oxygen_supplier.last_verified_at
    fill_in "Name", with: @oxygen_supplier.name
    check "Old" if @oxygen_supplier.old
    fill_in "Phone", with: @oxygen_supplier.phone
    check "Unavailable" if @oxygen_supplier.unavailable
    click_on "Update Oxygen supplier"

    assert_text "Oxygen supplier was successfully updated"
    click_on "Back"
  end

  test "destroying a Oxygen supplier" do
    visit oxygen_suppliers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Oxygen supplier was successfully destroyed"
  end
end
