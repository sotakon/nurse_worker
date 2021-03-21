require 'test_helper'

class RumorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rumors_index_url
    assert_response :success
  end

end
