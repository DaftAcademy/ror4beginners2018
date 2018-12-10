class ProductsController < ApplicationController
  def index
    @customer = Customer.find(params[:customer_id])
    @products = @customer.products.order(price: :desc)
  end

  private

  def product_params
    params.require(:product).permit(:price, :customer_id)
  end
end
