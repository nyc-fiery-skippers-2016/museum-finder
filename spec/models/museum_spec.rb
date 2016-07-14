require 'rails_helper'

describe Museum do
  let(:museum) { Museum.create(
    name: Faker::Lorem.word,
    formatted_address: Faker::Address.street_address,
    formatted_phone_number: Faker::PhoneNumber.phone_number,
    lat: Faker::Address.latitude,
    lng: Faker::Address.longitude,
    opening_hours: "{\"open_now\"=>false, \"periods\"=>[{\"close\"=>{\"day\"=>0, \"time\"=>\"1800\"}, \"open\"=>{\"day\"=>0, \"time\"=>\"1200\"}}, {\"close\"=>{\"day\"=>2, \"time\"=>\"1900\"}, \"open\"=>{\"day\"=>2, \"time\"=>\"1130\"}}, {\"close\"=>{\"day\"=>3, \"time\"=>\"1900\"}, \"open\"=>{\"day\"=>3, \"time\"=>\"1130\"}}, {\"close\"=>{\"day\"=>4, \"time\"=>\"1900\"}, \"open\"=>{\"day\"=>4, \"time\"=>\"1130\"}}, {\"close\"=>{\"day\"=>5, \"time\"=>\"1930\"}, \"open\"=>{\"day\"=>5, \"time\"=>\"1200\"}}, {\"close\"=>{\"day\"=>6, \"time\"=>\"1900\"}, \"open\"=>{\"day\"=>6, \"time\"=>\"1130\"}}], \"weekday_text\"=>[\"Monday: Closed\", \"Tuesday: 11:30 AM – 7:00 PM\", \"Wednesday: 11:30 AM – 7:00 PM\", \"Thursday: 11:30 AM – 7:00 PM\", \"Friday: 12:00 – 7:30 PM\", \"Saturday: 11:30 AM – 7:00 PM\", \"Sunday: 12:00 – 6:00 PM\"]}",
    photo: "https://lh3.googleusercontent.com/-HUuAyReXEic/VMmbgFRlcqI/AAAAAAAAANM/8q0X1DSwrvAjNGCxoPifwUbGFl-RjtRgg/s1600-w646/",
    place_id: "ChIJEeD6FPVYwokRgs0ZbWMrrzk",
    rates: "admission: $9; seniors/students, $7; under 12, free",
    is_free: nil)}

  describe "#validations" do
    it "is a valid Museum object" do
    expect(museum).to be_valid
    end

    let(:invalid_museum) { Museum.create(name: nil) }
    it "is an invalid Museum object" do
      expect(invalid_museum).not_to be_valid
    end
  end
end
