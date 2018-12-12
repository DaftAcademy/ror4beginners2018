8.times do |category|
  Category.find_or_create_by!(
    name: Faker::Commerce.department
    )
end

12.times do
  name = Faker::Name.last_name
  Customer.create!(
    name: name, 
    )
end

Customer.pluck(:id).each do |customer|
  5.times do
    Product.find_or_create_by!(
      name: Faker::Commerce.product_name, 
      price: Faker::Commerce.price, 
      customer_id: customer
      )
  end
end

Product.pluck(:id).each do |product|
  rand(1..5).times do
    ProductCategory.find_or_create_by!(
      product_id: product, 
      category_id: rand(1..8)
      )
  end
end