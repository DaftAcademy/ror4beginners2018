class CreateProducts < ActiveRecord::Migration[5.2]
  def change
	create_table :products do |t|
		t.string :name, null: false
		t.decimal :price, precision: 10, scale: 2, null: false
		t.index :name, unique: true

	  t.timestamps
	end
  end
end
