class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  scope :recent_active, -> {where("last_sign_in_at >= ?", 1.week.ago)}
  scope :except_user, ->(user_id) {where("id != ? ", user_id)}
  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
  has_one :profile
  has_many :profile_photos, through: :profile
end
