require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:tina)
  end

  test "micropost interface" do
  	log_in_as(@user)
  	get microposts_path
  	assert_select 'div.pagination'

  	#invalid submission
  	assert_no_difference 'Micropost.count' do
  		post microposts_path, micropost: { content: "" }
  	end
  	#assert_select 'div#error_explanation'

  	#valid submission
  	content = "hahahahhaha"
  	assert_difference 'Micropost.count', 1 do
  		post microposts_path, micropost: { content: content }
  	end

  	# Delete a post.
  	get microposts_path
    assert_select 'a', text: 'delete'
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    # Visit a different user.
    get user_path(users(:mike))
    assert_select 'a', text: 'delete', count: 0
  end

end
