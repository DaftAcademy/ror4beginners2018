class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.decimal :price, precision: 5, scale: 2, null: false
      t.references :customer, foregin_key: true
      t.timestamps
    end
  end
end
