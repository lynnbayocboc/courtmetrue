module ApplicationHelper
  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
   end

   def conversation_with_user_profile(conversation)
    profile = if current_user == conversation.receipts.first.receiver
                conversation.receipts.second.receiver.profile
              else
                conversation.receipts.first.receiver.profile
              end
    return profile
  end
end
