class AddReligiousValuesToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :religious_values, :string
  end
end
