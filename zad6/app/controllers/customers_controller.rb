class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
      @customer = Customer.find(params[:id])
      @products = @customer.products.order(price: :desc)
  end 
end
