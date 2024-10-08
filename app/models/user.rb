# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  has_secure_password

  has_many :user_ingredients, dependent: :destroy
  has_many :ingredients, through: :user_ingredients

  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def have_enough_ingredients_for?(recipe:)
    recipe.ingredients.all? do |ingredient|
      user_ingredient = ingredients.find_by(id: ingredient)
      user_ingredient.present?

      # TODO: Take the quantity into account
      # user_ingredient&.quantity >= recipe_ingredient.quantity
    end
  end
end
