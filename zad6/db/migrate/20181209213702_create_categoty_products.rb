class CreateCategotyProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :categoty_products do |t|

      t.timestamps
    end
  end
end
