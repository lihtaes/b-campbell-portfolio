require 'test_helper'

class TopisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get topis_index_url
    assert_response :success
  end

  test "should get show" do
    get topis_show_url
    assert_response :success
  end

end
