class Search < ActiveRecord::Base
  def self.for(keyword)
    Museum.where('LOWER(name) LIKE ?', "%#{keyword.downcase}%")
  end
end
