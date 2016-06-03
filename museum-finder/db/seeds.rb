# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
data = HTTParty.get('https://data.cityofnewyork.us/download/kcrm-j9hh/application/xml')
converted_data = Crack::XML.parse(data)
# converted_data = data.to_json
# binding.pry
# JSON.parse(converted_data)
museums = converted_data['museums']['museum']
museum_index = museums.each do |museum|
  Museum.create!( name: museum['name'] )
end

