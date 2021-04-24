require "test_helper"

class ExternalLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @external_link = external_links(:one)
  end

  test "should get index" do
    get external_links_url
    assert_response :success
  end

  test "should get new" do
    get new_external_link_url
    assert_response :success
  end

  test "should create external_link" do
    assert_difference('ExternalLink.count') do
      post external_links_url, params: { external_link: { description: @external_link.description, favicon: @external_link.favicon, title: @external_link.title, url: @external_link.url } }
    end

    assert_redirected_to external_link_url(ExternalLink.last)
  end

  test "should show external_link" do
    get external_link_url(@external_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_external_link_url(@external_link)
    assert_response :success
  end

  test "should update external_link" do
    patch external_link_url(@external_link), params: { external_link: { description: @external_link.description, favicon: @external_link.favicon, title: @external_link.title, url: @external_link.url } }
    assert_redirected_to external_link_url(@external_link)
  end

  test "should destroy external_link" do
    assert_difference('ExternalLink.count', -1) do
      delete external_link_url(@external_link)
    end

    assert_redirected_to external_links_url
  end
end
