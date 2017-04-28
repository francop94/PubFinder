require 'test_helper'

class PubsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_pub_url
    assert_response :success
  end

end
