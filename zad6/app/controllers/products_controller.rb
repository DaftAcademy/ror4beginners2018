class ProductsController < ApplicationController

    def index
        @customer = Customer.find(params[:customer_id])
        @products = @customer.products.order(price: :desc).includes(:categories)
    end

end