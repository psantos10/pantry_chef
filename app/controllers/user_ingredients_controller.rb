class UserIngredientsController < ApplicationController
  def create
    @user_ingredient = current_user.user_ingredients.build(user_ingredient_params)

    if @user_ingredient.save
      redirect_to ingredients_path, notice: "Ingredient added to your pantry"
    else
      render "ingredients/new", status: :unprocessable_entity
    end
  end

  def destroy
    @user_ingredient = current_user.user_ingredients.find(params[:id])
    @user_ingredient.destroy

    redirect_to ingredients_path, notice: "Ingredient removed from your pantry"
  end

  private

  def user_ingredient_params
    params.require(:user_ingredient).permit(:ingredient_id, :quantity)
  end
end
