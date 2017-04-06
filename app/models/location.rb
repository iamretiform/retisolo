class Location < ApplicationRecord
  has_many :sounds
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  has_many :locuses
  has_many :taggers, through: :locuses, source: "tagger_id", source_type: "User"
  has_many :pickers, through: :locuses, source: "picker_id", source_type: "User"
  has_many :solos
  has_many :sounds, through: :solos 
end

