# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'cleaning Ingredient database'

Ingredient.destroy_all

puts 'ingredient database is clean'
puts 'generating seed ingredients'


url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)["drinks"].map { |ingredient| ingredient["strIngredient1"] }

ingredients.sort { |a, b| a <=> b }.each do |ingredient|
  Ingredient.create(name: ingredient)
end

puts "ingredients generated; you now have #{Ingredient.count} ingredients"
