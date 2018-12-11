class CreateCategoryProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :category_products do |t|
      t.belongs_to :product, index: true
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
