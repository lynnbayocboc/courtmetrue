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

  # def user_has_filled_full_profile?
  #   if  !current_user.profile.finish_basic_info? ||
  #       !current_user.profile.finish_personal_info? ||
  #       !current_user.profile.finish_additional_info?
  #       return false
  #   else
  #       return true
  #   end
  # end

  # def profile_has_not_atleast_1_pic?
  #   current_user.profile.has_atleast_1_pic?
  # end
end
