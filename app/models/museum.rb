class Museum < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  serialize :photos

  has_many :museum_categories
  has_many :categories, through: :museum_categories
  has_many :specials
  has_many :favorites
  has_many :users,  through: :favorites

  def opening_hours
    # PANSAMPANSAM
    # This is still a antipattern
    # You should have clean data in your DB as cleaned in your seed file
    # If there are no opening hours for a museum, you could store an empty
    # array in the DB from the seed file. That way here, you shouldn't even
    # need this method, you could simply use "serialize :opening_hours"
    if super == nil
      return []
    else
      eval(super)["weekday_text"]
    end
  end

  def is_favorite?(current_user)
    # PANSAMPANSAM
    # Throw a !! in front of this call and it'll do the same thing as your ternary
  	self.favorites.find_by(user_id: current_user.id) ? true : false
  end

  def google_address_link
    # PANSAMPANSAM
    # Nice, I like this method!
    address = (self.name).split.join("+")
    return "https://www.google.com/maps/place/#{address}"
  end

  def hours_today
    opening_hours.each do |day|
      if day.include?(Date.today.strftime("%A"))
        return day
      end
    end
  end
end
