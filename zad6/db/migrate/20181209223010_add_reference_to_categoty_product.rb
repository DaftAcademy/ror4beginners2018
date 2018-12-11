class AddReferenceToCategotyProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :categoty_products, :product
    add_reference :categoty_products, :category
  end
end
