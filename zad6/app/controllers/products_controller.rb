class ProductsController < ApplicationController

    def index
        @products = Product.where('price <?', params[:price]).order(price: :desc)

    end

    
    
    
end
