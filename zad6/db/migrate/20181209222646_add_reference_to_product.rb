class AddReferenceToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :customer
  end
end
