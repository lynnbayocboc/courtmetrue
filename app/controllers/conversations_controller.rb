class ConversationsController < ApplicationController
	def index
		@conversations = current_user.mailbox.conversations
	end

	def show
		@conversation = current_user.mailbox.conversations.find(params[:id])
		@receipts = @conversation.receipts_for(current_user)
	end

	def new
		@user = User.find(params[:user_id])
	end

	def create
	end
end