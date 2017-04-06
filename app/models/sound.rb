class Sound < ApplicationRecord
  has_many :solos
  has_many :locations, through: :solos
end
