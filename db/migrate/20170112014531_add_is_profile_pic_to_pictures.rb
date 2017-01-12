class AddIsProfilePicToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :is_profile_pic, :boolean
  end
end
