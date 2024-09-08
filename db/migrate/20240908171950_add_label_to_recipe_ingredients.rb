class AddLabelToRecipeIngredients < ActiveRecord::Migration[7.2]
  def change
    add_column :recipe_ingredients, :label, :string
  end
end
