# Seed Users
puts 'Starting seed...'
Saxophone.destroy_all

puts 'Cleaning db...'
User.destroy_all

10.times do
  User.create!(email: Faker::Internet.email, password: "123456", full_name: Faker::Name.name, address: Faker::Address.full_address)
end

puts "#{User.count} users created!"

# Seed Saxophones

puts 'Creating saxophones...'

50.times do
  Saxophone.create!(title: Saxophone::MANUFACTURERS.sample + " " + Saxophone::MODELS.sample,
    manufacturer: Saxophone::MANUFACTURERS.sample,
    category: Saxophone::CATEGORIES.sample,
    sax_model: Saxophone::MODELS.sample,
    condition: Saxophone::CONDITIONS.sample,
    serial_number: rand(1000..9999).to_s,
    price: Faker::Commerce.price(range: 5000..100000.0),
    details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum lacinia mattis mauris, non eleifend mi consequat id. Aliquam lacinia elit sed magna dapibus, vitae fermentum enim varius.",
    user: User.all.sample,
    status: false)
end

puts "#{Saxophone.count} saxophones created!"
puts 'Finished! :D'
