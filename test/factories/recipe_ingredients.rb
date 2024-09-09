FactoryBot.define do
  factory :recipe_ingredient do
    recipe
    ingredient
    quantity { 1 }
    label { "#{quantity} #{ingredient.measure_unit} of #{ingredient.name}" }
  end
end
