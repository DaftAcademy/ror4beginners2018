# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
customer1 = Customer.create!(name: "Alicja")
customer2 = Customer.create!(name: "Adrianna")

category1 = Category.create!(name: "Kuchnia")
category2 = Category.create!(name: "Sypialnia")
category3 = Category.create!(name: "Lazienka")

p1 = customer1.products.create!(name: "Zmywarka", price: 50)
p2 = customer1.products.create!(name: "Lodówka", price: 60)
p3 = customer1.products.create!(name: "Widelce", price: 70.50)
p4 = customer1.products.create!(name: "Miska", price: 8000)
p5 = customer1.products.create!(name: "Wazon", price: 90.30)
p6 = customer1.products.create!(name: "Komoda", price: 90.30)
p7 = customer1.products.create!(name: "Szafka", price: 90.30)
p8 = customer1.products.create!(name: "Stolik", price: 90.30)
p9 = customer1.products.create!(name: "Prysznic", price: 90.30)
p10 = customer1.products.create!(name: "Wanna", price: 90.30)

CategoryProduct.create!(category_id: category1.id, product_id: p1.id)
CategoryProduct.create!(category_id: category1.id, product_id: p2.id)
CategoryProduct.create!(category_id: category1.id, product_id: p3.id)
CategoryProduct.create!(category_id: category1.id, product_id: p4.id)
CategoryProduct.create!(category_id: category1.id, product_id: p5.id)

CategoryProduct.create!(category_id: category2.id, product_id: p4.id)
CategoryProduct.create!(category_id: category2.id, product_id: p5.id)
CategoryProduct.create!(category_id: category2.id, product_id: p6.id)
CategoryProduct.create!(category_id: category2.id, product_id: p7.id)
CategoryProduct.create!(category_id: category2.id, product_id: p8.id)

CategoryProduct.create!(category_id: category3.id, product_id: p6.id)
CategoryProduct.create!(category_id: category3.id, product_id: p7.id)
CategoryProduct.create!(category_id: category3.id, product_id: p8.id)
CategoryProduct.create!(category_id: category3.id, product_id: p9.id)
CategoryProduct.create!(category_id: category3.id, product_id: p10.id)