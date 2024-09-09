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
FactoryBot.define do
  factory :recipe do
    title { "Recipe for Milk" }
    category { "Dessert" }
    image { "https://www.example.com/milk.jpg" }
    recipe_ingredients { [] }
  end
end
