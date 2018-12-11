class AddCustomerRefToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :customer, foreign_key: true
  end
end
