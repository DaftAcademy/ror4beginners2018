class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.float :price, null: false
      t.string :title, null: false
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
