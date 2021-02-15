class CreateProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    t.decimal :price, precision: 5, scale: 2

    t.timestamps
    end
  end
end
