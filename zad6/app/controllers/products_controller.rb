class ProductsController < ApplicationController
  def index
    @limit = Integer(params[:price]) rescue false
    if @limit != false and @limit > 0
      @products = Product.where('price < ?', @limit).order(price: :desc)
    else
      @products = Product.all.order(price: :desc)
    end
  end
end
