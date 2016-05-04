class FavouriteMailer < ApplicationMailer
  def set_as_favourite_notification_email(user_who_followed, user_who_is_being_followed)
    @user = user_who_followed
    @to_user = user_who_is_being_followed
    mail(from: "info@courtmetrue.com", to: @to_user.email, subject: "#{@user.profile.name} adds you in favourite list")
  end

  def view_by_notification(user_who_viewed,user_who_is_being_viewd)
  	@user = user_who_viewed
    @to_user = user_who_is_being_viewd
    mail(from: "info@courtmetrue.com", to: @to_user.email, subject: "Your profile has been viewed by #{@user.profile.name}")
  end
end
