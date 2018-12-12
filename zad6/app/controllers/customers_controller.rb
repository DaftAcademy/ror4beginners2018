class CustomersController < ApplicationController
#  before_action :set_customer, only: %i[show update destroy edit]
#  before_action :set_products_collection, only: %i[new edit create update]
  def index
    @customers = Customer.all
  end

end
