class CourtshipPreference < ApplicationRecord
  has_many :profile_courtship_preferences
  has_many :profiles, through: :profile_courtship_preferences
end
