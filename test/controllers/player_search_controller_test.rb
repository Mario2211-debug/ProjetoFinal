require "test_helper"

class PlayerSearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get player_search_index_url
    assert_response :success
  end
end
