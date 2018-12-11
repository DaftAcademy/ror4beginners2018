class CreateCustomer < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.index :name, unique: true
      t.index :email, unique: true

      t.timestamps
    end
  end
end
