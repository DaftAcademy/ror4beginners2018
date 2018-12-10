class ProductsController < ApplicationController

  def index
    @products = products_filtered.sorted
  end

  private

  def products_filtered
    products.where('price > ?', price)
  end

  def price
    params[:price].to_i
  end

  def products
    @products ||= Product.all
  end
end
