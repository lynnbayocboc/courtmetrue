class ConversationsController < ApplicationController
  def index
    @conversations = current_user.mailbox.inbox.page(5).per(20)
  end

  def sentbox
    @conversations = current_user.mailbox.sentbox.page(params[:page]).per(20)
  end

  def trash
    @conversations = current_user.mailbox.trash.page(params[:page]).per(20)
  end

  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])

    # Mark as read conversation when user sees messages
    current_user.mark_as_read(@conversation)

    @receipts = @conversation.receipts_for(current_user)

    @profile =  conversation_with_user_profile(@conversation)
  end

  def new
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def create
    recipient = User.find(params[:user_id])
    params[:subject] = "sent_to_#{recipient.id}"
    MessageMailer.notify_user_about_message(recipient).deliver_later
    receipt = current_user.send_message(recipient, params[:body], params[:subject])
    if receipt.conversation.from_user.blank? && receipt.conversation.to_user.blank?
      receipt.conversation.update(from_user: current_user.id, to_user: recipient.id)
    end
    redirect_to conversation_path(receipt.conversation)
  end

  def destroy_multiple_messages
    @conversations = current_user.mailbox.conversations.destroy(params[:conversation_ids])
    redirect_to :back
  end
end