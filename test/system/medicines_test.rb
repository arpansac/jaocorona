require "application_system_test_case"

class MedicinesTest < ApplicationSystemTestCase
  setup do
    @medicine = medicines(:one)
  end

  test "visiting the index" do
    visit medicines_url
    assert_selector "h1", text: "Medicines"
  end

  test "creating a Medicine" do
    visit medicines_url
    click_on "New Medicine"

    fill_in "Alternate phone", with: @medicine.alternate_phone
    fill_in "City", with: @medicine.city_id
    fill_in "Medicine name", with: @medicine.medicine_name
    fill_in "Phone", with: @medicine.phone
    click_on "Create Medicine"

    assert_text "Medicine was successfully created"
    click_on "Back"
  end

  test "updating a Medicine" do
    visit medicines_url
    click_on "Edit", match: :first

    fill_in "Alternate phone", with: @medicine.alternate_phone
    fill_in "City", with: @medicine.city_id
    fill_in "Medicine name", with: @medicine.medicine_name
    fill_in "Phone", with: @medicine.phone
    click_on "Update Medicine"

    assert_text "Medicine was successfully updated"
    click_on "Back"
  end

  test "destroying a Medicine" do
    visit medicines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Medicine was successfully destroyed"
  end
end
