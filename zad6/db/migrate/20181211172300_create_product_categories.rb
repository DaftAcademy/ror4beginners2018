class CreateProductCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_categories do |t|
      t.references :product
      t.references :category 
      t.timestamps
    end
  end
end
