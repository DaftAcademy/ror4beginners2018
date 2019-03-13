class References < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :customer, index: true
    add_reference :product_categories, :product
    add_reference :product_categories, :category
  end
end
