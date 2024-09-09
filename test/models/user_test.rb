# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "have_enough_ingredients_for? returns false when user has no ingredients for the recipe" do
    recipe = create(:recipe)
    user = create(:user)
    ingredient1 = create(:ingredient, name: "Sugar")
    ingredient2 = create(:ingredient, name: "Milk")

    create(:recipe_ingredient, recipe: recipe, ingredient: ingredient1, quantity: 2, label: "2 tablespoons of sugar")
    create(:recipe_ingredient, recipe: recipe, ingredient: ingredient2, quantity: 1, label: "1 cup of milk")

    assert_not user.have_enough_ingredients_for?(recipe: recipe)
  end

  test "have_enough_ingredients_for? returns true when user has no ingredients for the recipe" do
    recipe = create(:recipe)
    user = create(:user)
    ingredient1 = create(:ingredient, name: "Sugar")
    ingredient2 = create(:ingredient, name: "Milk")

    create(:recipe_ingredient, recipe: recipe, ingredient: ingredient1, quantity: 2, label: "2 tablespoons of sugar")
    create(:recipe_ingredient, recipe: recipe, ingredient: ingredient2, quantity: 1, label: "1 cup of milk")
    create(:user_ingredient, user: user, ingredient: ingredient1, quantity: 2)
    create(:user_ingredient, user: user, ingredient: ingredient2, quantity: 1)

    assert user.have_enough_ingredients_for?(recipe: recipe)
  end
end
