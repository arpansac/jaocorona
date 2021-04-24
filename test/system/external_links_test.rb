require "application_system_test_case"

class ExternalLinksTest < ApplicationSystemTestCase
  setup do
    @external_link = external_links(:one)
  end

  test "visiting the index" do
    visit external_links_url
    assert_selector "h1", text: "External Links"
  end

  test "creating a External link" do
    visit external_links_url
    click_on "New External Link"

    fill_in "Description", with: @external_link.description
    fill_in "Favicon", with: @external_link.favicon
    fill_in "Title", with: @external_link.title
    fill_in "Url", with: @external_link.url
    click_on "Create External link"

    assert_text "External link was successfully created"
    click_on "Back"
  end

  test "updating a External link" do
    visit external_links_url
    click_on "Edit", match: :first

    fill_in "Description", with: @external_link.description
    fill_in "Favicon", with: @external_link.favicon
    fill_in "Title", with: @external_link.title
    fill_in "Url", with: @external_link.url
    click_on "Update External link"

    assert_text "External link was successfully updated"
    click_on "Back"
  end

  test "destroying a External link" do
    visit external_links_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "External link was successfully destroyed"
  end
end
