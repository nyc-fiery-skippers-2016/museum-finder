class Museum < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  serialize :photos

  has_many :museum_categories
  has_many :categories, through: :museum_categories
  has_many :specials
  has_many :favorites
  has_many :users,  through: :favorites

end
