FactoryBot.define do
  factory :user_ingredient do
    user
    ingredient
    quantity { 1 }
  end
end
