
customer1 = Customer.create!(name: "Jaś")
customer2 = Customer.create!(name: "Małgosia")

category1 = Category.create!(name: "Ciastka")
category2 = Category.create!(name: "Cukierki")
category3 = Category.create!(name: "Słodycze")


p1 = customer1.products.create!(name: "Jeżyki", price: 4.50)
p2 = customer1.products.create!(name: "Michałki", price: 16.49)
p3 = customer1.products.create!(name: "Delicje", price: 3.50)
p4 = customer1.products.create!(name: "BelVita", price: 5.99)
p5 = customer1.products.create!(name: "Mamutki", price: 9.30)
p6 = customer2.products.create!(name: "Krówki", price: 11.25)
p7 = customer2.products.create!(name: "Landrynki", price: 7.77)
p8 = customer2.products.create!(name: "Kopiko", price: 15.20)
p9 = customer2.products.create!(name: "Kukułki", price: 6.66)

CategoryProduct.create!(category_id: category1.id, product_id: p1.id)
CategoryProduct.create!(category_id: category1.id, product_id: p3.id)
CategoryProduct.create!(category_id: category1.id, product_id: p4.id)
CategoryProduct.create!(category_id: category1.id, product_id: p5.id)
CategoryProduct.create!(category_id: category2.id, product_id: p2.id)
CategoryProduct.create!(category_id: category2.id, product_id: p6.id)
CategoryProduct.create!(category_id: category2.id, product_id: p7.id)
CategoryProduct.create!(category_id: category2.id, product_id: p8.id)
CategoryProduct.create!(category_id: category2.id, product_id: p9.id)
CategoryProduct.create!(category_id: category3.id, product_id: p1.id)
CategoryProduct.create!(category_id: category3.id, product_id: p2.id)
CategoryProduct.create!(category_id: category3.id, product_id: p3.id)
CategoryProduct.create!(category_id: category3.id, product_id: p4.id)
CategoryProduct.create!(category_id: category3.id, product_id: p5.id)
CategoryProduct.create!(category_id: category3.id, product_id: p6.id)
CategoryProduct.create!(category_id: category3.id, product_id: p7.id)
CategoryProduct.create!(category_id: category3.id, product_id: p9.id)


