class Special < ActiveRecord::Base
validates :description, presence: true

belongs_to :museum

end
