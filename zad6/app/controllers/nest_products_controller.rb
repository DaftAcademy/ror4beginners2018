class NestProductsController < ApplicationController
  def index
      @products = customer.products.all.order(price: :desc)

  end

  private

  def customer
      @customer ||= Customer.find(params[:customer_id])
  end
end
