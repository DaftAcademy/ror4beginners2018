class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, null: false, precision: 7, scale: 2, default: 0
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
