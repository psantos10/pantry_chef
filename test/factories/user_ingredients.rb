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
FactoryBot.define do
  factory :user_ingredient do
    user
    ingredient
    quantity { 1 }
  end
end
