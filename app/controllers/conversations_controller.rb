class ConversationsController < ApplicationController
	def index
		@conversations = current_user.mailbox.inbox
	end

	def sentbox
		@conversations = current_user.mailbox.sentbox
	end

	def show
		@conversation = current_user.mailbox.conversations.find(params[:id])

		# Mark as read conversation when user sees messages
		current_user.mark_as_read(@conversation)

		@receipts = @conversation.receipts_for(current_user)

		@profile = 	conversation_with_user_profile(@conversation)
	end

	def new
		@user = User.find(params[:user_id])
		@profile = @user.profile
	end

	def create
		recipient = User.find(params[:user_id])
		params[:subject] = "sent_to_#{recipient.id}"
		receipt = current_user.send_message(recipient, params[:body], params[:subject])
		redirect_to conversation_path(receipt.conversation)
	end
end