class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.page(params[:page]).per(9)
  end
end
