class ProfilePhoto < ApplicationRecord
  belongs_to :profile

  has_attached_file :photo,
    :styles => {
      :thumb => "100x100!",
      :small  => "150x150!",
      :medium => "220x220!" },
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"

  do_not_validate_attachment_file_type :photo

  scope :active_profile_pic, -> { where(is_profile_pic: true).first }
end
