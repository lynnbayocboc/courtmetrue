class ProfilePhoto < ActiveRecord::Base
	has_attached_file :photo, styles: { medium: "300x300>", thumb: "171x180#", active_photo: "149x149#" }, default_url: "missing.jpg"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
	belongs_to :profile

	scope :active_profile_pic, -> { where(is_profile_pic: true).first }
end
