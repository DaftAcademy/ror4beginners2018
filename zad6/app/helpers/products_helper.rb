module ProductsHelper

  def read_categories product
    product.categories.pluck(:name).join(', ')
  end  

  def read_customer product
    product.customer
  end

  def has_customer? product
    product.customer_id?
  end
end
