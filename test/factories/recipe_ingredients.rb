# == Schema Information
#
# Table name: recipe_ingredients
#
#  id            :bigint           not null, primary key
#  label         :string
#  quantity      :decimal(10, 5)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  ingredient_id :bigint           not null
#  recipe_id     :bigint           not null
#
# Indexes
#
#  index_recipe_ingredients_on_ingredient_id                (ingredient_id)
#  index_recipe_ingredients_on_recipe_id                    (recipe_id)
#  index_recipe_ingredients_on_recipe_id_and_ingredient_id  (recipe_id,ingredient_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (ingredient_id => ingredients.id)
#  fk_rails_...  (recipe_id => recipes.id)
#
FactoryBot.define do
  factory :recipe_ingredient do
    recipe
    ingredient
    quantity { 1 }
    label { "#{quantity} #{ingredient.measure_unit} of #{ingredient.name}" }
  end
end
