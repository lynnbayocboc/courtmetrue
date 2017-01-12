class Picture < ActiveRecord::Base
  belongs_to :profile

  has_attached_file :image,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" },
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"

  do_not_validate_attachment_file_type :image
end