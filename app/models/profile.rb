class Profile < ApplicationRecord
  belongs_to :user

  has_many :profile_photos
  has_many :profile_courtship_preferences
  has_many :courtship_preferences, through: :profile_courtship_preferences
  
  # validates_presence_of :name, :dob, :country, :state, :city,
  #                       :religion, :language, :ethnicity, :occupation, :household,
  #                       :height, :weight, :bodytype, :smoker, :drinker, :children, :wantkids,
  #                       :selfbio, :ideal, :tandc,
  #                       :gender, :status, :education, :profile_heading
                        
  accepts_nested_attributes_for :profile_photos, :allow_destroy => true, :reject_if => :all_blank


  def male?
    self.gender == "Male"
  end

  def female?
    self.gender == "Female"
  end

  def finish_basic_info?
    if  self.name.blank? || self.dob.blank? ||
        self.country.blank? || self.state.blank? || self.city.blank? ||
        self.gender.blank? || self.status.blank? || self.religion.blank? ||
        self.language.blank? || self.tandc.blank?
      false
    else
      true
    end
  end

  def finish_personal_info?
    if  self.ethnicity.blank? || self.occupation.blank? ||
        self.household.blank? ||
        self.height.blank? || self.weight.blank? ||
        self.bodytype.blank? || self.smoker.blank? ||
        self.drinker.blank? || self.children.blank? ||
        self.wantkids.blank? || self.education.blank?
      false
    else
      true
    end
  end

  def finish_additional_info?
    completed = false
    unless self.profile_heading.blank? || self.selfbio.blank? ||
        self.ideal.blank?
      completed = true
    end
    completed
  end

  def has_uploaded_5_pics?
    self.profile_photos.count < 6
  end

  def has_atleast_1_pic?
    self.profile_photos.count < 1
  end

  def first_photo?
    self.profile_photos.count == 0
  end

  def finished_profile?
    return finish_basic_info? && finish_personal_info? && finish_additional_info? ? true : false
  end

  def profile_pic
    self.profile_photos.first.try(:photo).try(:url, :thumb)
  end

  def address
    "#{city} #{country}"
  end

  def full_address
    the_address = ""
    the_address += "#{self.city}, " if !self.city.blank?
    the_address += "#{self.state}, " if !self.state.blank?
    the_address += self.country if !self.country.blank?
    the_address
  end
end
