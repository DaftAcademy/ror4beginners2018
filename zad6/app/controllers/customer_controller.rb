class CustomerController < ApplicationController
    def index
        @customer = Customer.all
    end
end
