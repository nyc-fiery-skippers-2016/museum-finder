class Category < ActiveRecord::Base
  validates :name, presence: true

  has_many :museum_categories
  has_many :museums, through: :museum_categories
end

# def self.top_six
#   top_six= ["Art", ""]
#   array = [self.name == "Art", self.name == ]
# end

