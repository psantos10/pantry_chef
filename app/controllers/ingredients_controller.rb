class IngredientsController < ApplicationController
  def index
    @user_ingredients = current_user.user_ingredients.page(params[:page])
    @most_relevant_recipes = Recipe.most_relevant_recipes(@user_ingredients.pluck(:ingredient_id))
  end

  def new
    @user_ingredient = current_user.user_ingredients.build
  end
end
