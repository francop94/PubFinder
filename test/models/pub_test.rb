require 'test_helper'

class PubTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:michael)
  	@pub = @user.pubs.build(address: "via tiburtina, 27, Roma", name: "Irish pub")
  end

  test "should be valid" do
  	assert @pub.valid?
  end

  test "user id should be present" do
  	@pub.user_id = nil
  	assert_not @pub.valid?
  end

  test "address should be present" do
  	@pub.address = "    "
  	assert_not @pub.valid?
  end

  test "address should be at most 140 characters" do
  	@pub.address = "a"*141
  	assert_not @pub.valid?
  end

  test "address shoud be at least 20 characters" do
  	@pub.address = "a"*19
  	assert_not @pub.valid?
  end

end
