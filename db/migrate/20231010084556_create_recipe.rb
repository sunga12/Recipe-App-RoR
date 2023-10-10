class CreateRecipe < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.float :preparation_time, null: false
      t.float :cooking_time, null: false
      t.text :description
      t.boolean :public, null: false, default: false
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
