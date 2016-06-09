class Search < ActiveRecord::Base
  def self.for(keyword)
    Museum.where('LOWER(name) LIKE ? OR LOWER(formatted_address) LIKE ?', "%#{keyword.downcase}%", "%#{keyword.downcase}%")
  end
end
