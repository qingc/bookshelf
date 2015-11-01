require 'test_helper'

class MicropostsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@micropost = microposts(:morning)
  end

  test "should redirect create when not logged in" do
  	assert_no_difference 'Micropost.count' do
  		post :create, micropost: { content: "hahah"}
  	end
  	assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Micropost.count' do
      delete :destroy, id: @micropost
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong micropost" do
    log_in_as(users(:tina))
    micropost = microposts(:mike)
    assert_no_difference 'Micropost.count' do
      delete :destroy, id: micropost
    end
    assert_redirected_to root_url
  end

end
