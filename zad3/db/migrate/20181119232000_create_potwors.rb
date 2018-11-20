class CreatePotwors < ActiveRecord::Migration[5.2]
  def change
    create_table :potwors do |t|
      t.string :name
      t.string :location
      t.string :best_slayer

      t.timestamps
    end
  end
end
