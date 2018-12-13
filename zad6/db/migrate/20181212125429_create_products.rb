class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
	  t.string :name, null: false
	  t.float :price, null: false
	  #t.decimal :price, null: false, scale: 2
	  t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
