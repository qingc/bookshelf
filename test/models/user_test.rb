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

end
