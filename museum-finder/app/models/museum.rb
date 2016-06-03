class Museum < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  serialize :photos

  belongs_to :category
  has_many :specials
  has_many :favorites
  has_many :users,  through: :favorites

end
