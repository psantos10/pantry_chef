class Search::IngredientsController < ApplicationController
  def search
    @ingredients = Ingredient.where("name like ?", "#{params[:q]}%")
      .order(:name)
      .limit(10)
  end
end
