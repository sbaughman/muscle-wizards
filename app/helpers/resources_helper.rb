module ResourcesHelper

  def unread_flag(resource)
    find_resourcery(resource).read ? "" : ' - <span class="bluish">New!</span>'
  end

  def resource_shared_date(resource)
    find_resourcery(resource).created_at.strftime('%D')
  end

  def find_resourcery(resource)
    Resourcery.find_by(resource_id: resource.id, prep_id: @prep.id)
  end

  def resource_shared?(resource)
    find_resourcery(resource)
  end
end
