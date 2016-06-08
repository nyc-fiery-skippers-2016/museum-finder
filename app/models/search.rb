class Search < ActiveRecord::Base
  def self.for(keyword)
    Museum.where('LOWER(name) LIKE ?', "%#{keyword.downcase}%")
  end
  def self.for_address(keyword)
    Museum.where('LOWER(formatted_address) LIKE ?', "%#{keyword.downcase}%")
  end
end
