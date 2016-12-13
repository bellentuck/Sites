require 'test_helper'

class SimpleControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get page1" do
    get simple_controller_page1_url
    assert_response :success
  end

  test "should get page2" do
    get simple_controller_page2_url
    assert_response :success
  end

  test "should get page3" do
    get simple_controller_page3_url
    assert_response :success
  end

end
