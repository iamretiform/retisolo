class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :locuses
  has_many :tagged_locations, through: :locuses, foreign_key: "location_id"
  has_many :picked_locations, through: :locuses, foreign_key: "location_id" 
end
