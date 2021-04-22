require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home_page" do
    get home_home_page_url
    assert_response :success
  end
end
