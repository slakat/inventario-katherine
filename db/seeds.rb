# This file should contain all the record creation needed to seed the database with sample values
# for development and staging environments.
#
# Data required for production should go into a database migration.
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#"id", "name", "nature", "cost", "price", "state"

20.times do
  Product.create(name: Faker::Commerce.product_name,cost: Faker::Number.between(500, 5000), price: Faker::Number.between(5000, 20000), state: "stock", quantity: Faker::Number.between(1, 50), code: Faker::Code.isbn  )
end


#"name", "price", "state"
5.times do
  Service.create(name: Faker::Commerce.product_name, price: Faker::Number.between(5000, 20000), state: "activo")
end


#"name", "price", "state"
5.times do
  ExtraProduct.create(name: Faker::Commerce.product_name,cost: Faker::Number.between(500, 5000), price: Faker::Number.between(5000, 20000), state: "using", quantity: Faker::Number.between(1, 50), code: Faker::Code.isbn  )
end