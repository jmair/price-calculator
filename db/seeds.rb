# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = [
  { name: 'milk', unit_price: 3.97, sale_quantity: 2, sale_price: 5.00, on_sale: true },
  { name: 'bread', unit_price: 2.17, sale_quantity: 3, sale_price: 6.00, on_sale: true },
  { name: 'banana', unit_price: 0.99, sale_quantity: 0, sale_price: 0, on_sale: false },
  { name: 'apple', unit_price: 0.89, sale_quantity: 0, sale_price: 0, on_sale: false }
]

products.each do |product|
  Product.create!(name: product[:name],
                  unit_price: product[:unit_price],
                  sale_quantity: product[:sale_quantity],
                  sale_price: product[:sale_price],
                  on_sale: product[:on_sale])
end