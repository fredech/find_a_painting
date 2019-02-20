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

user = User.create(first_name: "Anne", last_name: "Onime", address: "Paris", email: "anne.onime@gmail.com", password:"topsecret", password_confirmation:"topsecret")
user.photo = "avatar.png"

puts "#{User.count} users created"

puts "create Paintings ..."

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586498/Paintings/whilster.jpg"
painting_one = Painting.new(name: 'Night', location: "Paris", price: "100", author: "Whistler", style: "Painterly", user: user)
painting_one.remote_photo_url = url
painting_one.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586441/Paintings/van-gogh.jpg"
painting_two = Painting.new(name: 'Nighttime', location: "London", price: "200", author: "Van Gogh", style: "Painterly", user: user)
painting_two.remote_photo_url = url
painting_two.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586441/Paintings/morisot.jpg"
painting_three = Painting.new(name: 'Girl', location: "Barcelona", price: "300", author: "Morisot", style: "Painterly", user: user)
painting_three.remote_photo_url = url
painting_three.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586441/Paintings/picasso.jpg"
painting_four = Painting.new(name: 'Woman', location: "Paris", price: "500", author: "Picasso", style: "Painterly", user: user)
painting_four.remote_photo_url = url
painting_four.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586442/Paintings/warhol.jpg"
painting_five = Painting.new(name: 'Marilyn', location: "London", price: "100", author: "Warhol", style: "Painterly", user: user)
painting_five.remote_photo_url = url
painting_five.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586442/Paintings/monet.jpg"
painting_six = Painting.new(name: 'Waterlillies', location: "London", price: "500", author: "Monet", style: "Painterly", user: user)
painting_six.remote_photo_url = url
painting_six.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586441/Paintings/manet.jpg"
painting_seven = Painting.new(name: 'Folies Bergere', location: "Paris", price: "100", author: "Manet", style: "Painterly", user: user)
painting_seven.remote_photo_url = url
painting_seven.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586429/Paintings/hockney.jpg"
painting_eight = Painting.new(name: 'Pool', location: "London", price: "700", author: "Hockney", style: "Painterly", user: user)
painting_eight.remote_photo_url = url
painting_eight.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586428/Paintings/caravaggio.jpg"
painting_nine = Painting.new(name: 'Dude', location: "Barcelona", price: "100", author: "Caravaggio", style: "Painterly", user: user)
painting_nine.remote_photo_url = url
painting_nine.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586428/Paintings/da-vinci.jpg"
painting_ten = Painting.new(name: 'Mona', location: "Paris", price: "10", author: "Da Vinci", style: "Painterly", user: user)
painting_ten.remote_photo_url = url
painting_ten.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550674174/julien1.jpg"
painting_eleven = Painting.new(name: 'PoneyClub', location: "Paris", price: "1000000", author: "Julien da Silva", style: "Painterly", user: user)
painting_eleven.remote_photo_url = url
painting_eleven.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550674174/dessin_kevin.jpg"
painting_twelve = Painting.new(name: 'auto-portrait', location: "Paris", price: "1100000", author: "Kevin Robert", style: "Painterly", user: user)
painting_twelve.remote_photo_url = url
painting_twelve.save!


puts "#{Painting.count} paintings created"

puts "creating Bookings..."

booking = Booking.create(start_date: "20/02/2019", end_date: "20/03/2019", total_paid: "100", painting: painting_one, user: user)

booking = Booking.create(start_date: "20/02/2017", end_date: "20/03/2017", total_paid: "100", painting: painting_two, user: user)

booking = Booking.create(start_date: "20/02/2016", end_date: "20/03/2016", total_paid: "100", painting: painting_three, user: user)

booking = Booking.create(start_date: "20/04/2015", end_date: "23/06/2015", total_paid: "100", painting: painting_four, user: user)

booking = Booking.create(start_date: "22/04/2017", end_date: "15/07/2017", total_paid: "100", painting: painting_five, user: user)

puts "#{Booking.count} bookings created"

puts 'Finished!'
