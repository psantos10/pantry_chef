# == Schema Information
#
# Table name: recipes
#
#  id         :bigint           not null, primary key
#  category   :string
#  image      :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  test "self.most_relevant_recipes returns recipes with the matching ingredients" do
    recipe1 = create(:recipe, title: "Recipe 1")
    recipe2 = create(:recipe, title: "Recipe 2")

    ingredient1 = create(:ingredient, name: "Ingredient 1")
    ingredient2 = create(:ingredient, name: "Ingredient 2")
    ingredient3 = create(:ingredient, name: "Ingredient 3")

    create(:recipe_ingredient, recipe: recipe1, ingredient: ingredient1)
    create(:recipe_ingredient, recipe: recipe1, ingredient: ingredient2)
    create(:recipe_ingredient, recipe: recipe2, ingredient: ingredient3)

    most_relevant_recipes = Recipe.most_relevant_recipes([ ingredient1.id, ingredient2.id ])

    assert_equal 1, most_relevant_recipes.length
    assert_includes most_relevant_recipes, recipe1
    assert_not_includes most_relevant_recipes, recipe2

    most_relevant_recipes = Recipe.most_relevant_recipes([ ingredient3.id, ingredient2.id ])

    assert_equal 1, most_relevant_recipes.length
    assert_includes most_relevant_recipes, recipe2
    assert_not_includes most_relevant_recipes, recipe1
  end
end
