class CreateCategoryProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :category_products do |t|
      t.references :category, foregin_key: true
      t.references :product, foregin_key: true
      t.timestamps
    end
  end
end
