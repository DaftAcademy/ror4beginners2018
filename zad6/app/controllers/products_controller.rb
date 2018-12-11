class ProductsController < ApplicationController

    def index
        @customer = Customer.find_by!(name: params[:customer_name])
        @products = @customer.product.sorted
        @products = params.has_key?(:price) ? @products.cheaper_than(params[:price]) : @products
      end

end
