class ProductsController < ApplicationController
  def index
    return @products = Product.all unless params[:price]

    @products = Product.where('price < ?', params[:price])
  end
end
