# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer1 = Customer.create(name: "Jurek")
customer2 = Customer.create(name: "Wookie")

category1 = Category.create(name: "Warzywko")
category2 = Category.create(name: "Zabawka")
category3 = Category.create(name: "Kurtka")

p1 = customer1.products.create(price: 5000)
p2 = customer1.products.create(price: 6000)
p3 = customer1.products.create(price: 7000)
p4 = customer1.products.create(price: 8000)
p5 = customer1.products.create(price: 9000)
p6 = customer2.products.create(price: 10000)
p7 = customer2.products.create(price: 50)
p8 = customer2.products.create(price: 500)
p9 = customer2.products.create(price: 25000)
p10 = customer2.products.create(price: 25)

CategoryProduct.create(category_id: category1.id, product_id: p1.id)
CategoryProduct.create(category_id: category1.id, product_id: p2.id)
CategoryProduct.create(category_id: category1.id, product_id: p3.id)
CategoryProduct.create(category_id: category1.id, product_id: p4.id)
CategoryProduct.create(category_id: category1.id, product_id: p5.id)

CategoryProduct.create(category_id: category2.id, product_id: p4.id)
CategoryProduct.create(category_id: category2.id, product_id: p5.id)
CategoryProduct.create(category_id: category2.id, product_id: p6.id)
CategoryProduct.create(category_id: category2.id, product_id: p7.id)
CategoryProduct.create(category_id: category2.id, product_id: p8.id)

CategoryProduct.create(category_id: category3.id, product_id: p6.id)
CategoryProduct.create(category_id: category3.id, product_id: p7.id)
CategoryProduct.create(category_id: category3.id, product_id: p8.id)
CategoryProduct.create(category_id: category3.id, product_id: p9.id)
CategoryProduct.create(category_id: category3.id, product_id: p10.id)

