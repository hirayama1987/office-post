require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show_all" do
    get pages_show_all_url
    assert_response :success
  end

end
