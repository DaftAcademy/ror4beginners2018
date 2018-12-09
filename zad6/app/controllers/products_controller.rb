class ProductsController < ApplicationController
  def index
    @customer = Customer.find_by!(id: params[:customer_id])
    @products = @customer.products.sorted
  end
end
