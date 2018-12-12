# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

krzysztof = Customer.create(name: 'Krzysztof')
adrian = Customer.create(name: 'Adrian')
robert = Customer.create(name: 'Robert')

itn = Category.create(name: 'itn')
zaoczne = Category.create(name: 'zaoczne')
dzienne = Category.create(name: 'dzienne')

ppj = Product.create(price: 800, name: 'PPJ', customer: krzysztof)
asd = Product.create(price: 799.99, name: 'ASD', customer: robert)
alg = Product.create(price: 8, name: 'ALG', customer: adrian)

sad = Product.create(price: 5.5, name: 'SAD', customer: krzysztof)
wf = Product.create(price: 239.99, name: 'WF', customer: adrian)
nai = Product.create(price: 1100, name: 'NAI', customer: robert)

tpo = Product.create(price: 740, name: 'TPO', customer: robert)
gui = Product.create(price: 54.99, name: 'GUI', customer: adrian)
grk = Product.create(price: 4.5, name: 'GRK', customer: robert)

itn.category_products.create(product: ppj)
itn.category_products.create(product: asd)
itn.category_products.create(product: alg)

zaoczne.category_products.create(product: sad)
zaoczne.category_products.create(product: wf)
zaoczne.category_products.create(product: nai)

dzienne.category_products.create(product: tpo)
dzienne.category_products.create(product: gui)
dzienne.category_products.create(product: grk)
