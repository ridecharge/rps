require 'test_helper'

class PlaysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get plays_new_url
    assert_response :success
  end

  test "should get throw" do
    get plays_throw_url
    assert_response :success
  end

end
