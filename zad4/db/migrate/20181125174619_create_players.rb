class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :power
      t.boolean :captain, null: false, default: false
      t.timestamps
    end
  end
end
