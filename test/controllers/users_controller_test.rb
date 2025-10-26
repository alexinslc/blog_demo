require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    user = users(:one)
    get user_url(user.id)
    assert_response :success
  end
end
