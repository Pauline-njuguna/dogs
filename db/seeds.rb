# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Seeds for Users
user1=User.create!(name: "John Doe", email: "johndoe@example.com", phone: 0776666, location: "Ntiwa", password: "1234", password_confirmation: "1234") 

# Seeds for Pets
pet1=Pet.create(name: "Fluffy", age: 23, species: "cat", breed: "Aus", user_id: user1.id)
