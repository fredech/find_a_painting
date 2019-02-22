# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Painting.destroy_all
User.destroy_all

puts "create Users ..."

onime = User.create(first_name: "Anne", last_name: "Onime", address: "16 villa Gaudelet, Paris", email: "anne.onime@gmail.com", password:"topsecret", password_confirmation:"topsecret", photo:"avatar.png")
alice = User.create(first_name: "Alice", last_name: "Brewer", address: "10 villa Gaudelet, Paris", email: "alice@gmail.com", password:"topsecret", password_confirmation:"topsecret", photo:"alice.png")
antoine = User.create(first_name: "Antoine", last_name: "Patouillaud", address: "12 villa Gaudelet, Paris", email: "antoine@gmail.com", password:"topsecret", password_confirmation:"topsecret", photo:"antoine.png")
fred = User.create(first_name: "Frederic", last_name: "Chochon", address: "14 villa Gaudelet, Paris", email: "frederic@gmail.com", password:"topsecret", password_confirmation:"topsecret", photo:"fred.png")
damien = User.create(first_name: "Damien", last_name: "Arnaud", address: "107 rue des couronnes, Paris", email: "damien@gmail.com", password:"topsecret", password_confirmation:"topsecret", photo:"damien.png")
users = [onime, alice, antoine, fred, damien]

puts "#{User.count} users created"

puts "create Paintings ..."

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586498/Paintings/whilster.jpg"
painting_one = Painting.new(name: 'Night', location: "#{Faker::Address.street_address}, #{Faker::Address.city}", price: "100", author: "Whistler", style: "Painterly", user: users.sample)
painting_one.remote_photo_url = url
painting_one.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586441/Paintings/van-gogh.jpg"
painting_two = Painting.new(name: 'Nighttime', location: "#{Faker::Address.street_address}, #{Faker::Address.city}", price: "200", author: "Van Gogh", style: "Painterly", user: users.sample)
painting_two.remote_photo_url = url
painting_two.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586441/Paintings/morisot.jpg"
painting_three = Painting.new(name: 'Girl', location: "#{Faker::Address.street_address}, #{Faker::Address.city}", price: "300", author: "Morisot", style: "Painterly", user: users.sample)
painting_three.remote_photo_url = url
painting_three.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586441/Paintings/picasso.jpg"
painting_four = Painting.new(name: 'Woman', location: "#{Faker::Address.street_address}, #{Faker::Address.city}", price: "500", author: "Picasso", style: "Painterly", user: users.sample)
painting_four.remote_photo_url = url
painting_four.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586442/Paintings/warhol.jpg"
painting_five = Painting.new(name: 'Marilyn', location: "#{Faker::Address.street_address}, #{Faker::Address.city}", price: "100", author: "Warhol", style: "Painterly", user: users.sample)
painting_five.remote_photo_url = url
painting_five.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586442/Paintings/monet.jpg"
painting_six = Painting.new(name: 'Waterlillies', location: "#{Faker::Address.street_address}, #{Faker::Address.city}", price: "500", author: "Monet", style: "Painterly", user: users.sample)
painting_six.remote_photo_url = url
painting_six.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586441/Paintings/manet.jpg"
painting_seven = Painting.new(name: 'Folies Bergere', location: "#{Faker::Address.street_address}, #{Faker::Address.city}", price: "100", author: "Manet", style: "Painterly", user: users.sample)
painting_seven.remote_photo_url = url
painting_seven.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586429/Paintings/hockney.jpg"
painting_eight = Painting.new(name: 'Pool', location: "#{Faker::Address.street_address}, #{Faker::Address.city}", price: "700", author: "Hockney", style: "Painterly", user: users.sample)
painting_eight.remote_photo_url = url
painting_eight.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586428/Paintings/caravaggio.jpg"
painting_nine = Painting.new(name: 'Dude', location: "#{Faker::Address.street_address}, #{Faker::Address.city}", price: "100", author: "Caravaggio", style: "Painterly", user: users.sample)
painting_nine.remote_photo_url = url
painting_nine.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586428/Paintings/da-vinci.jpg"
painting_ten = Painting.new(name: 'Mona', location: "#{Faker::Address.street_address}, #{Faker::Address.city}", price: "10", author: "Da Vinci", style: "Painterly", user: users.sample)
painting_ten.remote_photo_url = url
painting_ten.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550674174/julien1.jpg"
painting_eleven = Painting.new(name: 'PoneyClub', location: "#{Faker::Address.street_address}, #{Faker::Address.city}", price: "1000000", author: "Julien da Silva", style: "Painterly", user: users.sample)
painting_eleven.remote_photo_url = url
painting_eleven.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550674174/dessin_kevin.jpg"
painting_twelve = Painting.new(name: 'auto-portrait', location: "#{Faker::Address.street_address}, #{Faker::Address.city}", price: "1100000", author: "Kevin Robert", style: "Painterly", user: users.sample)
painting_twelve.remote_photo_url = url
painting_twelve.save!


puts "#{Painting.count} paintings created"

puts "creating Bookings..."

40.times do |booking|
  painting = Painting.all.sample
  booking = Booking.create(start_date: "20/02/2019", end_date: "20/03/2019", total_paid: "#{painting.price.to_i * 28}", painting: painting, user: users.sample)
end

puts "#{Booking.count} bookings created"

puts 'Finished!'
