class Sighting < ApplicationRecord
    belongs_to :animal
    validates :date, :time, :latitude, :longitude, :region, presence: true
end
