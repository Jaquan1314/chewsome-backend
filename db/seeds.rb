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

response = RestClient::Request.execute(
  method: "GET",
  url: "https://api.yelp.com/v3/businesses/search?term=delis&location=nyc&sort_by=rating",
  headers: { Authorization: "Bearer #{ENV['YELP_API_KEY']}" },
)
parse_resp = JSON.parse(response)
restaurants = parse_resp['businesses']

# byebug

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

puts 'creating restaurants'
restaurants.each do |restaurant|
  Restaurant.create!(
    name: restaurant['name'],
    url: restaurant['url'],
    image_url: restaurant['image_url'],
    location: restaurant['location']['address1'],
    rating: restaurant['rating'],
    coordinates: restaurant['coordinates'].to_s,
    photos: '',
    phone: restaurant['display_phone'],
  )
end



puts 'creating reviews'
Review.create!(
  user_id: 1,
  restaurant_id: 1,
  rating: 5,
  text: "Wow talk about amazing service",
)