class CreateProductCategory < ActiveRecord::Migration[5.2]
  def change
    create_table :product_categories do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :category, foreign_key: true
    end
  end
end
