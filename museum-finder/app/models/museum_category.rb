class MuseumCategory < ActiveRecord::Base
  belongs_to :museum
  belongs_to :category
end
