class Museum < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  serialize :photos

  has_many :museum_categories
  has_many :categories, through: :museum_categories
  has_many :specials
  has_many :favorites
  has_many :users,  through: :favorites

  def opening_hours
    if super == nil
      return []
    else
      eval(super)["weekday_text"]
    end
  end

  def is_favorite?(current_user)
  	self.favorites.find_by(user_id: current_user.id) ? true : false
  end

  def google_address_link
    address = (self.name).split.join("+")
    return "https://www.google.com/maps/place/#{address}"
  end

  def self.free_museums(category)
    self.where(category: category, is_free: "true")
  end

  def self.cost_museums(category)
    self.where(category: category, is_free: nil)
  end

  def self.favorite_museums(category)
    self.favorites.where(category: category)
  end

  def hours_today
    opening_hours.each do |day|
      if day.include?(Date.today.strftime("%A"))
        return day
      end
    end
  end
end
