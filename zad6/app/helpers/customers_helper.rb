module CustomersHelper
  def customers_not_empty?
    @customers && !@customers.empty?
  end
end
