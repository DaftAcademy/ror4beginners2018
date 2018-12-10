class CreateCategoryProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :category_products do |t|
      t.references :product
      t.references :category
      t.timestamps
    end

    remove_reference :products, :categories
  end
end
