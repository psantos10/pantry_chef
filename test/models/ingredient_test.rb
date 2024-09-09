# == Schema Information
#
# Table name: ingredients
#
#  id           :bigint           not null, primary key
#  measure_unit :integer          default("unit")
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_ingredients_on_name  (name) UNIQUE
#
require "test_helper"

class IngredientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
