require "test_helper"

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = create(:user)
    login_as(user)
  end

  test "should get index" do
    get ingredients_index_url
    assert_response :success
  end

  test "should get new" do
    get ingredients_new_url
    assert_response :success
  end
end
