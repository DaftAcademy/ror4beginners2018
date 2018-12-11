class NestProductsController < ApplicationController
  def index
      @products = customer.products.all.order_by(price:)

  end

  private

  def customer
      @customer ||= Customer.find(params[:customer_id])
  end
end
