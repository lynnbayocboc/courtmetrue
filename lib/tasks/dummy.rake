namespace :dummy  do
  task add_users: :environment do
    10.times do
      user = User.create do |u|
        u.email = Faker::Internet.email
        u.password = 'foobar01'
        u.password_confirmation = 'foobar01'
        u.last_sign_in_at = Time.now
      end
      p "user #{user.errors.full_messages}"
      profile = user.build_profile
      profile.name = Faker::Name.name
      profile.dob = Date.today - rand(20..28).years
      profile.save
      # profile_photo = ProfilePhoto.new
      # uri = URI.parse(Faker::Avatar.image)
      # uri.scheme = 'https'
      # p "url #{uri}"
      # p "url gsub #{url.gsub("­http","htt­ps")}"
      # url = url.gsub("­http","htt­ps")
      # profile_photo.is_profile_pic = true
      # profile_photo.photo =  uri
      # profile_photo.profile = profile
      # profile_photo.save
    end
  end
end
