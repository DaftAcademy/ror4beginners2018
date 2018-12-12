class ProductsController < ApplicationController
  def index
    @products = customer.products.order(price: :desc).includes(:categories)
    @products = @products.where('price < ?', params[:price]) if params.key?(:price)
  end

  def index2
    @customers = Products.all
  end

  private
  def customer
    @customer ||= Customer.find(params[:customer_id])
  end 
end
