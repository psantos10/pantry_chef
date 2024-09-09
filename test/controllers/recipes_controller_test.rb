require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get root page" do
    get root_url
    assert_response :success
  end
end
