class ProductsController < ApplicationController
  def index
  	@customer = Customer.find(params[:customer_id])
    @products = @customer.products.sorted
    if params.has_key?(:price)
      @products = @products.cheaper_than(params[:price])
    end
  end
end
