module PrepsHelper

  def new_resource_count
    @new_resource_count = @prep.resourceries.where("read = ?", false).count
    @new_resource_count > 0 ? "Resources (#{@new_resource_count})" : "Resources"
  end

  def new_message_count
    messages = Conversation.between(@prep.user_id, @prep.coach_id).first.messages
    new_messages = messages.where("user_id = ? AND read = ?", other_user(current_user), false).count
    new_messages > 0 ? "(#{new_messages})" : ""
  end

end
