# frozen_string_literal: true

# Create three categories
swords = Category.create!(title: 'Swords')
axes = Category.create!(title: 'Axes')
maces = Category.create!(title: 'Maces')

# Create customers
gimli = Customer.create(name: 'Gimli')
garosh = Customer.create(name: 'Garosh')
thrall = Customer.create(name: 'Thrall')

# Create lists of products
swords_products = [
    Product.create!(price: 10.5, title: 'Short Sword', customer: gimli),
    Product.create!(price: 20.90, title: 'Long Sword', customer: garosh),
    Product.create!(price: 7.95, title: 'Gladius', customer: garosh)
]
axes_products = [
    Product.create!(price: 5.50, title: 'WTomahawk', customer: gimli),
    Product.create!(price: 20000.90, title: 'Gorehowl', customer: garosh),
    Product.create!(price: 500.90, title: 'Two-Handend Axe', customer: gimli),
    Product.create!(price: 7.50, title: 'One-handed Axe', customer: thrall)
]
maces_products = [
    Product.create!(price: 10000.00, title: 'Doomhammer', customer: thrall),
    Product.create!(price: 20000.90, title: 'Noob smasher', customer: gimli),
    Product.create!(price: 10.00, title: 'The Glazer', customer: garosh)
]

swords_products.each { |product| swords.category_products.create!(product: product) }
axes_products.each { |product| axes.category_products.create!(product: product) }
maces_products.each { |product| maces.category_products.create!(product: product) }
