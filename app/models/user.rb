class User < ActiveRecord::Base
  acts_as_messageable

  enum role: [:user, :vip, :admin]
  enum gender_types: [:male, :female]
  after_initialize :set_default_role, :if => :new_record?

  scope :recent_active, -> {where("last_sign_in_at >= ?", 1.week.ago)}
  scope :newest_members, -> {where("created_at <= ?", 3.week.ago)}
  scope :oldest_members, -> {where("created_at >= ?", 3.months.ago)}
  scope :except_user, ->(user_id) {where("id != ? ", user_id)}
  scope :total_online_users, -> { where("updated_at > ? ", 10.minutes.ago).count }

  def online?
    self.updated_at > 10.minutes.ago
  end

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
  has_one :profile
  has_many :profile_photos, through: :profile

  def mailboxer_email(object)
    nil
  end
end
