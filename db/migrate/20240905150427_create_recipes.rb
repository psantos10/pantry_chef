class CreateRecipes < ActiveRecord::Migration[7.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :category
      t.string :image

      t.timestamps
    end
  end
end
