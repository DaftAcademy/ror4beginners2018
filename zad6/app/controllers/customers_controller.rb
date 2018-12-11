class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find_by(id: [:customer_id])
    @products = @customer.products.sorted
  end
end
