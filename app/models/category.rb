class Category < ActiveRecord::Base
  validates :name, presence: true

  has_many :museum_categories
  has_many :museums, through: :museum_categories

  def free_museums
  	museums.where(is_free: "true")
  end

  def cost_museums
  	museums.where(is_free: nil)
  end

  #method to only display categories with museums sorted into them
  def has_museums?
  	self.museums != []
  end

end

