class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def customer_products
    @customer = Customer.find_by(id: params[:customer_id])
    @customer_products = @customer.products
  end
end
