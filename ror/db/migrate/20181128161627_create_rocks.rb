class CreateRocks < ActiveRecord::Migration[5.2]
  def change
    create_table :rocks do |t|
      t.float :weight, null: false
      t.string :nickname, null:false
      t.timestamps
    end
  end
end
