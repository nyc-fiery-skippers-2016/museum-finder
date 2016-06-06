
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

data = HTTParty.get('https://data.cityofnewyork.us/download/kcrm-j9hh/application/xml')
converted_data = Crack::XML.parse(data)

museums = converted_data['museums']['museum']

@client = GooglePlaces::Client.new("AIzaSyAuZ_wtI3N7LcecgNJ_sJVq_Aun5WB9W10")

queried_museums = museums.map do |museum|
  @client.spots_by_query(museum["name"])
end

full_museum_data = queried_museums.map do |museum|
  @client.spot(museum.first.place_id)
end

cleaned_museum_data = full_museum_data.map do |museum|
  museum_hash = {}
  museum_hash[:name] = museum.name
  museum_hash[:formatted_address] = museum.formatted_address
  museum_hash[:formatted_phone_number] = museum.formatted_phone_number
  museum_hash[:lat] = museum.lat
  museum_hash[:lng] = museum.lng
  museum_hash[:opening_hours] = museum.opening_hours
  museum_hash[:photos] = @client.spot(museum.place_id).photos[0].fetch_url(800)
  museum_hash[:place_id] = museum.place_id
  museum_hash
end

cleaned_museum_data.each_with_index do |museum, idx|
  Museum.create!(
    name: museum[:name],
    formatted_address: museum[:formatted_address],
    formatted_phone_number: museum[:formatted_phone_number],
    lat: museum[:lat],
    lng: museum[:lng],
    opening_hours: museum[:opening_hours],
    photos: museum[:photos],
    place_id: museum[:place_id],
    rates: museums[idx]["rates"])
end

#museum free data

freeArray = [2, 8, 10, 24, 20, 26, 27, 28, 37, 43]

freeArray.each do |museumId|
  Museum.find(museumId).update_attributes!(is_free: "true")
end

#create categories

categories = ["Art", "Classic Art", "Decorative/Design", "Modern/Contemporary", "Film/Photography", "Sculpture", "Textile", "Architecture", "History", "Natural History/Science", "Historic Homes", "Sports", "Military/Police", "Science", "Technology", "Media", "Transportation", "Maritime", "Zoo", "Garden", "Children's", "Cultural", "Memorial", "African American", "Local", "Jewish", "Native American", "Regional", "Amusement", "Religious", "Music", "Outdoor"]

categories.each do |category|
  Category.create!(
    name: category)
end

artArray1 = [1,4,8,10,11,12,13,14,15,24,20,21,22,26,29,36,37,38,44,46]
historyArray9 = [2,19,21,27,41,33,34,42,43]
scienceArray14 = [5,6,16,30,31,32,34,39,40]
childrensArray21 = [7,9]
culturalArray22 = [3,12,17,18,19,23,25,28,35,42]
outdoorArray32 = [5,6,16,31,35,40,45]

artArray1.each do |museumId|
  MuseumCategory.create!(museum_id: museumId, category_id: 1)
end

historyArray9.each do |museumId|
  MuseumCategory.create!(museum_id: museumId, category_id: 9)
end

scienceArray14.each do |museumId|
  MuseumCategory.create!(museum_id: museumId, category_id: 14)
end

childrensArray21.each do |museumId|
  MuseumCategory.create!(museum_id: museumId, category_id: 21)
end

culturalArray22.each do |museumId|
  MuseumCategory.create!(museum_id: museumId, category_id: 22)
end

outdoorArray32.each do |museumId|
  MuseumCategory.create!(museum_id: museumId, category_id: 32)
end

#create users

users = [
  {name: "kat", email: "kat@example.com", password: "password"},
  {name: "sibel", email: "sibel@example.com", password: "password"},
  {name: "brian", email: "brian@example.com", password: "password"}
]

users.each { |user| User.create!(user)}

#create favorites

userfav1 = [1, 10, 2, 16, 9, 12, 5, 45]
userfav2 = [15, 24, 27, 31, 7, 35, 16, 39]
userfav3 = [22, 26, 29, 42, 43, 18, 28, 25]

userfav1.each do |museumId|
  Favorite.create!(user_id: 1, museum_id: museumId)
end

userfav2.each do |museumId|
  Favorite.create!(user_id: 2, museum_id: museumId)
end

userfav3.each do |museumId|
  Favorite.create!(user_id: 3,
    museum_id: museumId)
end

#create specials

museums.each do |museum|
  found = Museum.find_by(rates: museum["rates"])
    Special.create!(
      description: museum["specials"],
      museum_id: found.id)
end