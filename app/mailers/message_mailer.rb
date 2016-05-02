class MessageMailer < ApplicationMailer
	def notify_user_about_message(user,current_user)
		@user = current_user
    @to_user = user
    mail(to: @to_user.email, subject: "You have one unread message from #{current_user.profile.name}")

	end
end
