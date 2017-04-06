class Location < ApplicationRecord
  has_many :sounds, dependent: :destroy
  has_many :users, through: :sounds
  validates :address, presence: true, uniqueness: true, case_sensitive: false
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
