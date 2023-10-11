# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# routes:

# foods: index new create destroy
# recipes: index show edit update destroy => ingredients: index edit update destroy
# public_recipes: index show
# general_shopping_list: index

# DB:

# user
# foods
# recipe
# recipe food

user1 = User.create!(name: "Admin")
user2 = User.create!(name: "Default")
user3 = User.create!(name: "Riz")


Food.create!(user: user1, name: "Apple", price: "5")
Food.create!(user: user1, name: "Orange", price: "2")
Food.create!(user: user1, name: "chicken breasts", price: "20")
Food.create!(user: user1, name: "pepper powder", price: "1", measurement_unit: "grams")
