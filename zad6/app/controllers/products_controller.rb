class ProductsController < ApplicationController
  def index
	@customer = Customer.find_by!(name: params[:customer_name])
	@products = params.has_key?(:price) ? @customer.product.cheap(params[:price]).sorted : @customer.product.sorted
	end
end
