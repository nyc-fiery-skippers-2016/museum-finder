class Museum < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

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
  	!!self.favorites.find_by(user_id: current_user.id)
  end

  def google_address_link
    address = (self.name).split.join("+")
    return "https://www.google.com/maps/place/#{address}"
  end

  def hours_today
    today = Date.today.strftime("%A")
    opening_hours.each do |day|
      if day.include?(today)
        return day.gsub(today, "")
      end
    end
  end
end
