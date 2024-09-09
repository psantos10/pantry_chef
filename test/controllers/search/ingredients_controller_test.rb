require "test_helper"

class Search::IngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = create(:user)
    login_as(user)
  end

  test "search returns matching ingredients" do
    Ingredient.create!(name: "Sugar")
    Ingredient.create!(name: "Salt")
    Ingredient.create!(name: "Pepper")

    get search_ingredients_path(q: "Sug"), as: :turbo_stream

    assert_response :success

    assert_includes response.body, "Sugar"
    assert_not_includes response.body, "Salt"
    assert_not_includes response.body, "Pepper"
  end

  test "search returns no results for non-matching query" do
    Ingredient.create!(name: "Sugar")
    Ingredient.create!(name: "Salt")

    get search_ingredients_path(q: "Flour"), as: :turbo_stream

    assert_response :success

    assert_not_includes response.body, "Sugar"
    assert_not_includes response.body, "Salt"
  end
end
