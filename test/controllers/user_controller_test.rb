require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get report" do
    get user_report_url
    assert_response :success
  end

end
