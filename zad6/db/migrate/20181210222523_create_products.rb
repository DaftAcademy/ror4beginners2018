class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.decimal :price, precision: 10, scale: 2
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
