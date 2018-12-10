class CustomerProductsController < ApplicationController
  def index
    @products = customer.products.sorted
  end

  private

  def customer
    @customer ||= Customer.find(params[:customer_id])
  end
end
