class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @recipes = Recipe.all.page(params[:page]).per(9)
  end
end
