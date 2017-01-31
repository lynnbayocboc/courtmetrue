class CreateAdminService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
        user.admin!
        user.save!(validate: false)
      end
      profile = user.build_profile
      profile.name = 'Admin User'
      profile.gender = 'male'
      profile.dob = Date.today - rand(20..28).years
      profile.save
      profile_photo = ProfilePhoto.new
      uri = URI.parse(Faker::Avatar.image)
      uri.scheme = 'https'
      profile_photo.is_profile_pic = true
      profile_photo.photo =  uri
      profile_photo.profile = profile
      profile_photo.save
      return user
  end
end
