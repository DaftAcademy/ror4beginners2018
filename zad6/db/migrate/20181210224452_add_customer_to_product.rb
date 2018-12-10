class AddCustomerToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :customer
    add_reference :products, :categories
  end
end