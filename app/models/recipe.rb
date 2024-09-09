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
class Recipe < ApplicationRecord
  validates :title, :category, presence: true

  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients

  def self.most_relevant_recipes(ingredient_ids)
    Recipe.joins(:recipe_ingredients)
      .where(recipe_ingredients: { ingredient_id: ingredient_ids })
      .group(:id)
      .having("COUNT(DISTINCT recipe_ingredients.ingredient_id) = (SELECT COUNT(DISTINCT ri.ingredient_id) FROM recipe_ingredients ri WHERE ri.recipe_id = recipes.id)")
      .order("COUNT(recipe_ingredients.recipe_id) DESC")
      .limit(5)
  end
end
