class AddExperienceWithCourtshipToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :experience_with_courtship, :string
  end
end
