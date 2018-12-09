class AddNameToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :name, :string
  end
end
