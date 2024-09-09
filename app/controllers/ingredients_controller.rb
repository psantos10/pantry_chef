class IngredientsController < ApplicationController
  def index
    @user_ingredients = current_user.user_ingredients.page(params[:page])
  end

  def new
    @user_ingredient = current_user.user_ingredients.build
  end
end
