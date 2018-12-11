class CreateProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, precision: 6, scale: 2
      t.belongs_to :customer, foreign_key: true
#      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
