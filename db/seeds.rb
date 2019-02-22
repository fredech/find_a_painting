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

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550829741/avatar.png"
onime = User.new(first_name: "Anne", last_name: "Onime", address: "16 villa Gaudelet, Paris", email: "anne.onime@gmail.com", password:"topsecret", password_confirmation:"topsecret")
onime.remote_photo_url = url
onime.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550829723/alice.png"
alice = User.new(first_name: "Alice", last_name: "Brewer", address: "10 villa Gaudelet, Paris", email: "alice@gmail.com", password:"topsecret", password_confirmation:"topsecret")
alice.remote_photo_url = url
alice.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550829740/antoine.jpg"
antoine = User.new(first_name: "Antoine", last_name: "Patouillaud", address: "12 villa Gaudelet, Paris", email: "antoine@gmail.com", password:"topsecret", password_confirmation:"topsecret")
antoine.remote_photo_url = url
antoine.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550829741/fred.jpg"
fred = User.new(first_name: "Frederic", last_name: "Chochon", address: "14 villa Gaudelet, Paris", email: "frederic@gmail.com", password:"topsecret", password_confirmation:"topsecret")
fred.remote_photo_url = url
fred.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550829741/damien.jpg"
damien = User.new(first_name: "Damien", last_name: "Arnaud", address: "107 rue des couronnes, Paris", email: "damien@gmail.com", password:"topsecret", password_confirmation:"topsecret")
damien.remote_photo_url = url
damien.save!


users = [onime, alice, antoine, fred, damien]

puts "#{User.count} users created"

puts "create Paintings ..."

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586498/Paintings/whilster.jpg"
painting_one = Painting.new(name: 'Night', location: "53 rue d'Hauteville, Paris", price: "100", author: "Whistler", style: "Painterly", user: alice)
painting_one.remote_photo_url = url
painting_one.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586441/Paintings/van-gogh.jpg"
painting_two = Painting.new(name: 'Nighttime', location: "6 place des Vosges, Paris", price: "200", author: "Van Gogh", style: "Painterly", user: alice)
painting_two.remote_photo_url = url
painting_two.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586441/Paintings/morisot.jpg"
painting_three = Painting.new(name: 'Girl', location: "11, avenue du Président Wilson}, Paris", price: "300", author: "Morisot", style: "Painterly", user: alice)
painting_three.remote_photo_url = url
painting_three.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586441/Paintings/picasso.jpg"
painting_four = Painting.new(name: 'Woman', location: "100 bis, rue d'Assas, Paris", price: "500", author: "Picasso", style: "Painterly", user: alice)
painting_four.remote_photo_url = url
painting_four.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586442/Paintings/warhol.jpg"
painting_five = Painting.new(name: 'Marilyn', location: "18, rue Antoine Bourdelle, Paris", price: "100", author: "Warhol", style: "Painterly", user: users.sample)
painting_five.remote_photo_url = url
painting_five.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586442/Paintings/monet.jpg"
painting_six = Painting.new(name: 'Waterlillies', location: "7 avenue Vélasquez, Paris", price: "500", author: "Monet", style: "Painterly", user: users.sample)
painting_six.remote_photo_url = url
painting_six.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586441/Paintings/manet.jpg"
painting_seven = Painting.new(name: 'Folies Bergere', location: "Trafalgar Square, London", price: "100", author: "Manet", style: "Painterly", user: users.sample)
painting_seven.remote_photo_url = url
painting_seven.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586429/Paintings/hockney.jpg"
painting_eight = Painting.new(name: 'Pool', location: "King Charles St, London", price: "700", author: "Hockney", style: "Painterly", user: users.sample)
painting_eight.remote_photo_url = url
painting_eight.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586428/Paintings/caravaggio.jpg"
painting_nine = Painting.new(name: 'Dude', location: "63 Wells St, Fitzrovia, London", price: "100", author: "Caravaggio", style: "Painterly", user: users.sample)
painting_nine.remote_photo_url = url
painting_nine.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550586428/Paintings/da-vinci.jpg"
painting_ten = Painting.new(name: 'Mona', location: "150 rue De Rivoli, Paris", price: "10", author: "Da Vinci", style: "Painterly", user: users.sample)
painting_ten.remote_photo_url = url
painting_ten.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550674174/julien1.jpg"
painting_eleven = Painting.new(name: 'PoneyClub', location: "Marylebone Rd, Marylebone, London", price: "1000000", author: "Julien da Silva", style: "Painterly", user: users.sample)
painting_eleven.remote_photo_url = url
painting_eleven.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550674174/dessin_kevin.jpg"
painting_twelve = Painting.new(name: 'auto-portrait', location: "48 Doughty St, London", price: "1100000", author: "Kevin Robert", style: "Painterly", user: users.sample)
painting_twelve.remote_photo_url = url
painting_twelve.save!

url = "https://res.cloudinary.com/dwze88uqm/image/upload/v1550683198/Kevin2.jpg"
painting_last = Painting.new(name: 'auto-portrait', location: "16 villa Gaudelet, 75011 Paris", price: "1100000", author: "Kevin Robert", style: "Painterly", user: users.sample)
painting_last.remote_photo_url = url
painting_last.save!


puts "#{Painting.count} paintings created"

puts "creating Bookings..."

40.times do |booking|
  painting = Painting.all.sample
  booking = Booking.create(start_date: "20/02/2019", end_date: "20/03/2019", total_paid: "#{painting.price.to_i * 28}", painting: painting, user: users.sample)
end

puts "#{Booking.count} bookings created"

puts 'Finished!'
