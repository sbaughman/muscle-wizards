module PrepsHelper

  def new_resource_count
    @new_resource_count = @prep.resourceries.where("read = ?", false).count
    @new_resource_count > 0 ? "Resources (#{@new_resource_count})" : "Resources"
  end

  def new_message_count_print
    new_message_count > 0 ? "(#{new_message_count})" : ""
  end

end
