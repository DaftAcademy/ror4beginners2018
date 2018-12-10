class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :email, null: false, unique: true
      t.integer :products_count, default: 0
      t.timestamps
    end
  end
end
