class FavouriteMailer < ApplicationMailer
  def set_as_favourite_notification_email(user_who_followed, user_who_is_being_followed)
    @user = user_who_followed
    @to_user = user_who_is_being_followed
    mail(to: @to_user.email, subject: "#{@user.profile.name} adds you in favourite list")
  end
end
