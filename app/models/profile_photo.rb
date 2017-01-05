class ProfilePhoto < ApplicationRecord
  has_attached_file :photo,
                    :processors => [:watermark],
                     styles: {
                              :medium => {
                              :geometry       => "220x220>",
                              :watermark_path => "#{Rails.root}/public/images/watermark.png",
                              :position => "Center"
                              },
                                thumb: "171x180#",
                                active_photo: "149x149#",
                                conversation_thumb: "50x50#"
                                 }, default_url: "missing.jpg"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  belongs_to :profile

  scope :active_profile_pic, -> { where(is_profile_pic: true).first }
end
