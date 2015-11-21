require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "tt", email: "tt@bookshelf.com",
                password: "password", password_confirmation: "password")
  end


  test "associated microposts should be destroyed" do 
    @user.save
    @user.microposts.create!(content: "hahaha")
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end
  end

  test "should follow and unfollow a user" do
    tina = users(:tina)
    mike = users(:mike)
    assert_not tina.following?(mike)
    tina.follow(mike)
    assert tina.following?(mike)
    assert mike.followers.include?(tina)
    tina.unfollow(mike)
    assert_not tina.following?(mike)
  end

  test "feed should have the right posts" do
    tina = users(:tina)
    jim  = users(:jim)
    lana = users(:lana)
    # Posts from followed user
    lana.microposts.each do |post_following|
      assert mike.feed.include?(post_following)
    end
    # Posts from self
    lana.microposts.each do |post_self|
      assert lana.feed.include?(post_self)
    end
    # Posts from unfollowed user
    lana.microposts.each do |post_unfollowed|
      assert_not tina.feed.include?(post_unfollowed)
    end
  end

end
