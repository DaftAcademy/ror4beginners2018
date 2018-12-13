class ProductsController < ApplicationController

  def index
    @products = products.filtered(price).sorted
  end

  private

  def price
    params.has_key?(:price) ? params[:price].to_i : Product.maximum("price").to_i + 1 #Można zastąpić stałą
  end

  def products
    @products ||= Product.all
  end
end
