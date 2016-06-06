class Category < ActiveRecord::Base
  validates :name, presence: true

  has_many :museum_categories
  has_many :museums, through: :museum_categories

  def self.free_museums(category)
    self.find_by(id: category.id).museums.where(is_free: "true")
  end

   def self.cost_museums(category)
    self.find_by(id: category.id).museums.where(is_free: nil)
  end
end
