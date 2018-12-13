class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    customer
  end

  # def new
  #   @customer = Customer.new
  # end
  
  # def create
  #   @customer = Customer.new(customer_params)
  #   if @customer.save
  #     redirect_to customer_path(email: @customer.email), notice: 'User created'
  #   else
  #     render 'new'
  #   end
  # end

  private
  def customer_params
    params.require(:customer).permit(:email)
  end

  def customer
    @customer ||= Customer.find_by(id: params[:id])
  end

end
