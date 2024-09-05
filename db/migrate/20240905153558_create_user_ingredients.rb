class CreateUserIngredients < ActiveRecord::Migration[7.2]
  def change
    create_table :user_ingredients do |t|
      t.references :user, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.decimal :quantity, precision: 10, scale: 5

      t.timestamps
    end
    add_index :user_ingredients, [ :user_id, :ingredient_id ], unique: true
  end
end
