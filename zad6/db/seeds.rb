5.times do
  name = Faker::Internet.username
  Customer.find_or_create_by!(name: name,email: Faker::Internet.email(name))
end

5.times do |category|
  Category.find_or_create_by!(name: Faker::Commerce.department(1,true))
end

Customer.pluck(:id).each do |customer|
  5.times do
    Product.create!(
      name: Faker::Commerce.product_name,
      price: Faker::Commerce.price,
      customer_id: customer
    )
  end
end

Product.pluck(:id).each do |product|
  rand(1..3).times do
    ProductCategory.find_or_create_by!(product_id: product, category_id: rand(1..5))
  end
end
