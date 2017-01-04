class AddFirstPhotoToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :first_photo, :string
    add_column :profiles, :second_photo, :string
    add_column :profiles, :third_photo, :string
    add_column :profiles, :fourth_photo, :string
    add_column :profiles, :fifth_photo, :string
  end
end
