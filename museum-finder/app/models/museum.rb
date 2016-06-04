class Museum < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  serialize :photos

  has_many :museum_categories
  has_many :categories, through: :museum_categories
  has_many :specials
  has_many :favorites
  has_many :users,  through: :favorites

  def is_favorite?(current_user)
  	self.favorites.find_by(user_id: current_user.id) ? true : false
  end

  def format_hours
    formatted = eval(self.opening_hours)
    formatted["weekday_text"]
  end

end
