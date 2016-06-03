class Category < ActiveRecord::Base
  validates :name, presence: true

  has_many :museum_categories
  has_many :museums, through: :museum_categories
end
