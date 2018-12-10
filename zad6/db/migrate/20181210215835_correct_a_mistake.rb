class CorrectAMistake < ActiveRecord::Migration[5.2]
  def change
    change_table :customers do |t|
      t.index :name, unique: true
  end
end
end