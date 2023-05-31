require 'open-uri'
require 'unsplash'
# Seed Users
puts 'Starting seed...'
Saxophone.destroy_all

puts 'Cleaning db...'
User.destroy_all

20.times do
  User.create!(email: Faker::Internet.email, password: "123456", full_name: Faker::Name.name, address: Faker::Address.full_address)
end

puts "#{User.count} users created!"

# Seed Saxophones

puts 'Creating saxophones...'

Unsplash.configure do |config|
  config.application_access_key = "q3CUY3MkcmFT_14OwLac1B7RlG4gFjahNyUz274LfPw"
  config.application_secret = "vBmhRU-MGWaiiFUGT7wVr0JXUOP9kIvaG_uKLwaCVBw"
  config.application_redirect_uri = "https://your-application.com/oauth/callback"
  config.utm_source = "alices_terrific_client_app"
end

50.times do
  saxophone = Saxophone.new(title: Saxophone::MANUFACTURERS.sample + " " + Saxophone::MODELS.sample,
    manufacturer: Saxophone::MANUFACTURERS.sample,
    category: Saxophone::CATEGORIES.sample,
    sax_model: Saxophone::MODELS.sample,
    condition: Saxophone::CONDITIONS.sample,
    serial_number: rand(1000..9999).to_s,
    price: Faker::Commerce.price(range: 5000..100000.0),
    details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum lacinia mattis mauris, non eleifend mi consequat id. Aliquam lacinia elit sed magna dapibus, vitae fermentum enim varius.",
    user: User.all.sample,
    status: false)

  saxophone_photo = Unsplash::Photo.random(query: "saxophone")

  if saxophone_photo.present?
    saxophone.photo.attach(io: URI.open(saxophone_photo.urls.regular), filename: 'saxophone_photo.jpg')
    saxophone.save!
  else
    puts "Failed to find a saxophone photo"
  end
end

puts "#{Saxophone.count} saxophones created!"
puts 'Finished! :D'

  # Seed before connecting to image/cloudinary
  # 50.times do
  #   Saxophone.create!(title: Saxophone::MANUFACTURERS.sample + " " + Saxophone::MODELS.sample,
  #     manufacturer: Saxophone::MANUFACTURERS.sample,
  #     category: Saxophone::CATEGORIES.sample,
  #     sax_model: Saxophone::MODELS.sample,
  #     condition: Saxophone::CONDITIONS.sample,
  #     serial_number: rand(1000..9999).to_s,
  #     price: Faker::Commerce.price(range: 5000..100000.0),
  #     details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum lacinia mattis mauris, non eleifend mi consequat id. Aliquam lacinia elit sed magna dapibus, vitae fermentum enim varius.",
  #     user: User.all.sample,
  #     status: false)
  # end

  # Seed with one single image from cloudinary
  # photo_url = "https://res.cloudinary.com/dfjub9qt4/image/upload/v1685466052/development/z9tj71mprvfgj3521qdy02eutpws.webp"
  # downloaded_photo = URI.open(photo_url)
  # saxophone.photo.attach(io: downloaded_photo, filename: 'saxophone_photo.webp')
  # saxophone.save!
