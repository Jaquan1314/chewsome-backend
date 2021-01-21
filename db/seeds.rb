# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Favorite.destroy_all
Review.destroy_all
Restaurant.destroy_all
User.destroy_all

# puts 'creating Restaurants'
# 10.times do
#   Restaurant.create!(
#     name: Faker::Restaurant.unique.name,
#     "url": '',
#     "image_url": Faker::Avatar.image,
#     "location": Faker::Address.street_address,
#     "rating": '',
#     "coordinates": '',
#     "photos": '',
#     "phone": Faker::PhoneNumber.cell_phone
#   )
# end



puts 'creating users 👨‍👩‍👧‍👦 '

user_arr = [
  {
    username: 'Twin',
    email: 'abc@abc',
    password: 'abc123'

  },
  {
    username: 'Dianna',
    email: 'dian@dian',
    password: 'abc123'
  },
  {
    username: 'Renee',
    email: 'ren@ren',
    password: 'abc123'
  },
]

user_arr.each do |uesrObj|
  User.create!(uesrObj)
end