class CreateFood < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.string :measurement_unit, null: false, default: "units"
      t.integer :price, null: false
      t.integer :quantity, null: false, default: 1
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
