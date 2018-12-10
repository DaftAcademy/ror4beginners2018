customer1 = Customer.create!(name: "Czesio", email: "czeslaw@example.com")
customer2 = Customer.create!(name: "Daniel", email: "dariusz@przyklad.pl")

category1 = Category.create!(name: "Dla dzieci")
category2 = Category.create!(name: "Do domu")
category3 = Category.create!(name: "Dla nerdow")

prod1 = customer1.products.create!(name: "Glosna zabawka", price: 21.37)
prod2 = customer1.products.create!(name: "Cicha zabawka", price: 432.34)
prod3 = customer1.products.create!(name: "Pralka", price: 420)
prod4 = customer2.products.create!(name: "Klawisz", price: 2.64)
prod5 = customer2.products.create!(name: "Myszka", price: 65.99)

CategoryProduct.create!(category_id: category1.id, product_id: prod1.id)
CategoryProduct.create!(category_id: category2.id, product_id: prod2.id)
CategoryProduct.create!(category_id: category3.id, product_id: prod3.id)
CategoryProduct.create!(category_id: category1.id, product_id: prod4.id)
CategoryProduct.create!(category_id: category2.id, product_id: prod5.id)
