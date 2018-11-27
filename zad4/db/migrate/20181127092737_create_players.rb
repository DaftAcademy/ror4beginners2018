class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.boolean :captain, default: false, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :power
      t.timestamps
    end
  end
end
