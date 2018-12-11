class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.float :price, precision: 6, scale: 2, null: false
      t.text :description
      t.belongs_to :customer, foreign_key: true

      t.timestamps
    end
  end
end
