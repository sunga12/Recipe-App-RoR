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
