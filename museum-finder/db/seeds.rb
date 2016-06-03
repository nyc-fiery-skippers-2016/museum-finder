Museum.delete_all

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
  museum_hash[:photos] = museum.photos
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

Museum.find(1,4,7).update_all(category: "Modern")




