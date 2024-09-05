# == Schema Information
#
# Table name: ingredients
#
#  id           :bigint           not null, primary key
#  measure_unit :integer          default(0)
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_ingredients_on_name  (name) UNIQUE
#
class Ingredient < ApplicationRecord
  enum :measure_unit, { unit: 0, cup: 1, teaspoon: 2, tablespoon: 3, ounce: 4, gram: 5, pound: 6, milliliter: 7, liter: 8 }

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients
  has_many :user_ingredients, dependent: :destroy
  has_many :users, through: :user_ingredients
end
