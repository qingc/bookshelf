require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:tina)
  	@other_user = users(:mike)
  end

  test "should redirect following when not logged in" do
  	get :following, id: @user
  	assert_redirected_to login_url
  end

  test "should redirect followers when not logged in" do
  	get :followers, id: @user
  	assert_redirected_to login_url
  end
end
