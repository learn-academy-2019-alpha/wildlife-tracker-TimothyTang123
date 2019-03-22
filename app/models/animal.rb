class Animal < ApplicationRecord
    has_many :sightings
    validates :name, :latin_name, :kingdom, presence: true
    validates :name, :latin_name, :kingdom, uniqueness: true
end
