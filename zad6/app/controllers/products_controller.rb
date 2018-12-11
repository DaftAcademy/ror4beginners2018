class ProductsController < ApplicationController
  def index
    @products = Product.all.sorted.cheaper_than(p)
  end
end
