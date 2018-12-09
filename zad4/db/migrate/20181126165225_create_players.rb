class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      #t.type :column, **options
      t.boolean :captain, null: false, default: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :power
    end
  end
end
