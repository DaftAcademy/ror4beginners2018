class ProductsController < ApplicationController
    def index
        @customer = Customer.find_by!(id: params[:customer_id])
        @products = @customer.products.order(price: :desc).higher_than(price_params)
    end

    private
    
    def price_params
        params[:price] ? params[:price] : 0
    end
   
end

