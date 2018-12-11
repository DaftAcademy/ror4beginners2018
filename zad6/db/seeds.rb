# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
customer1 = Customer.create!(name: "Harry")
customer2 = Customer.create!(name: "Hermiona")
customer3 = Customer.create!(name: "Ron")

category1 = Category.create!(name: "Artefakt")
category2 = Category.create!(name: "Miotly")
category3 = Category.create!(name: "Rozdzki")

p1 = customer1.products.create!(name: "11 cali, pioro feniksa", price: 12.50)
p2 = customer1.products.create!(name: "Kamien wskrzeszenia", price: 9999)
p3 = customer1.products.create!(name: "Nimbus 2000", price: 50)

p4 = customer2.products.create!(name: "10 cali, smocze serce", price: 12.50)
p5 = customer2.products.create!(name: "Peleryna niewidka", price: 9999)
p6 = customer2.products.create!(name: "Kometa 140", price: 7)

p7 = customer3.products.create!(name: "12 cali, wlos jednorozdzca", price: 12.50)
p8 = customer3.products.create!(name: "Blyskawica", price: 450)
p9 = customer3.products.create!(name: "Czarna rozdzka", price: 9999)

CategoryProduct.create!(category_id: category1.id, product_id: p2.id)
CategoryProduct.create!(category_id: category1.id, product_id: p5.id)
CategoryProduct.create!(category_id: category1.id, product_id: p9.id)

CategoryProduct.create!(category_id: category2.id, product_id: p3.id)
CategoryProduct.create!(category_id: category2.id, product_id: p6.id)
CategoryProduct.create!(category_id: category2.id, product_id: p8.id)

CategoryProduct.create!(category_id: category3.id, product_id: p1.id)
CategoryProduct.create!(category_id: category3.id, product_id: p4.id)
CategoryProduct.create!(category_id: category3.id, product_id: p7.id)
CategoryProduct.create!(category_id: category3.id, product_id: p9.id)

