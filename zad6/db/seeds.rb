# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#30.times do
#	Product.create!(name: Faker::Cannabis.unique.strain, price: rand(30.0..40.0).round(2))
#end

#10.times do
#    Customer.create!(name: Faker::Cat.unique.name)
#end

#10.times do
#	Category.create!(name: Faker::Cannabis.unique.category)
#end	

#Customer.first.products.create!(product: Product.order("RANDOM()").first(2))

#Faker::Cannabis.unique.clear
#Faker::Cat.unique.clear

customer1 = Customer.create!(name: 'customer1')
Product.create!(name: 'product1', price: 5, customer: customer1)
Product.create!(name: 'product2', price: 15, customer: customer1)
Product.create!(name: 'product3', price: 10, customer: customer1)

customer2 = Customer.create!(name: 'customer2')
Product.create!(name: 'product4', price: 115, customer: customer2)
Product.create!(name: 'product5', price: 13, customer: customer2)
Product.create!(name: 'product6', price: 1, customer: customer2)

customer3 = Customer.create!(name: 'customer3')
Product.create!(name: 'product7', price: 1, customer: customer3)
Product.create!(name: 'product8', price: 8, customer: customer3)
Product.create!(name: 'product9', price: 96, customer: customer3)
Product.create!(name: 'product10', price: 3, customer: customer3)
Product.create!(name: 'product11', price: 22, customer: customer3)
Product.create!(name: 'product12', price: 122, customer: customer3)


#Product.order("RANDOM()").first(3)

#Customer.first


