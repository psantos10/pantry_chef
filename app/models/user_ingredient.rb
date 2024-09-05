# == Schema Information
#
# Table name: user_ingredients
#
#  id            :bigint           not null, primary key
#  quantity      :decimal(10, 5)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  ingredient_id :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_user_ingredients_on_ingredient_id              (ingredient_id)
#  index_user_ingredients_on_user_id                    (user_id)
#  index_user_ingredients_on_user_id_and_ingredient_id  (user_id,ingredient_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (ingredient_id => ingredients.id)
#  fk_rails_...  (user_id => users.id)
#
class UserIngredient < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient

  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0.00001 }
  validates :user_id, uniqueness: { scope: :ingredient_id }
end
