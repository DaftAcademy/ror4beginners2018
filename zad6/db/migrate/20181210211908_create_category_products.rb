class CreateCategoryProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :category_products do |t|
      add_reference :products, :category
      t.timestamps
    end
  end
end
