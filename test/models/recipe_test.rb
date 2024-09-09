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
  # test "the truth" do
  #   assert true
  # end
end
