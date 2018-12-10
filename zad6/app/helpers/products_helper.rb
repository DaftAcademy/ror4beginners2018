module ProductsHelper

  def read_categories product
    result = [];
    product.category_ids.each {|category_id| result << read_category(category_id)}
    result.join(", ")
  end  

  def read_category id
    Category.find(id).name
  end

  def read_customer_email product
    read_customer(product).email
  end

  def read_customer product
    Customer.find(product.customer_id) if has_customer?
  end

  def has_customer? product
    product.customer_id
  end
end
