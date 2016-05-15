module ResourceriesHelper

  def resource_shared_with_prep(resource)
    resource.preps.include? @prep
  end

end
