# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Seed Users
# 10.times do
#   User.create(email: Faker::Internet.email, password: "123456", full_name: Faker::Name.name, address: Faker::Address.full_address)
# end

# Seed Saxophones
# puts 'Starting seed...'

# puts 'Cleaning db...'
# Saxophone.destroy_all

# puts 'Creating saxophones...'


# 50.times do
#   Saxophone.create!(title: Saxophone::MANUFACTURERS.sample + " " + Saxophone::MODELS.sample,
#     manufacturer: Saxophone::MANUFACTURERS.sample,
#     category: Saxophone::CATEGORIES.sample,
#     sax_model: Saxophone::MODELS.sample,
#     condition: Saxophone::CONDITIONS.sample,
#     serial_number: rand(1000..9999).to_s,
#     price: Faker::Commerce.price(range: 5000..100000.0),
#     details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum lacinia mattis mauris, non eleifend mi consequat id. Aliquam lacinia elit sed magna dapibus, vitae fermentum enim varius.",
#     user_id: rand(1..10))
# end

# puts "#{Saxophone.count} saxophones created!"
# puts 'Finished! :D'
