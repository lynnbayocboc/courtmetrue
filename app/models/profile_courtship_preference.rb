class ProfileCourtshipPreference < ApplicationRecord
  belongs_to :profile
  belongs_to :courtship_preference
end
