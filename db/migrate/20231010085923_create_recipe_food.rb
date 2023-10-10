class CreateRecipeFood < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity, null: false, default: 1
      t.references :recipe, null: false, foreign_key: true, index: true
      t.references :food, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
