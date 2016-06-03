# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# museums = holds list of museums

# @client = GooglePlaces::Client.new("AIzaSyAuZ_wtI3N7LcecgNJ_sJVq_Aun5WB9W10")

# queried_museums = museums.each do |museum|
#   @client.spots_by_query(museum.name)
# end

# full_museum_data = queried_museums.each do |museum|
#   @client.spot(museum.place_id)
# end

# full_museum_data.each do |musem|
#   museum.slice!("name", "formatted_address", "formatted_phone_number", "lat", "lng", "opening hours", "photos", "place_id")
# end

# end