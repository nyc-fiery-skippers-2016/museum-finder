require 'rails_helper'

describe Category do
  let(:category) { Category.create( name: Faker::Lorem.word) }

  describe "#validations" do
    it "is a valid Category object" do
      expect(category).to be_valid
    end

    let(:invalid_category) { Category.create(name: nil) }
    it "is an invalid Category object" do
      expect(invalid_category).not_to be_valid
    end
  end
end
