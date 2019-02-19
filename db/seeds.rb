# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "create Users ..."

User.create(first_name: "le", last_name: "sagouin", address: "Paris", email: "lesagouin@gmail.com", password:"topsecret", password_confirmation:"topsecret")

puts "#{User.count} users created"
puts 'Finished!'
