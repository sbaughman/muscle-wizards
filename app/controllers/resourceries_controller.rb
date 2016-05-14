class ResourceriesController < ApplicationController
  before_action :require_user
  before_action :user_owns_resource, only: [:create]

  def new
    @resource = Resource.find(params[:resource])
    @resourcery = Resourcery.new
    @preps = Prep.where("coach_id = ?", current_user.id)
  end

  def create
    prep_ids = params[:resourcery][:prep_id]
    prep_ids.each do |id|
      Resourcery.create(resource_id: params[:resourcery][:resource_id], prep_id: id) unless id.blank?
    end
    flash[:success] = "Resource shared"
    redirect_to user_path(current_user)
  end

  private

  def resourcery_params
    params.require(:resourcery).permit(:resource_id, :prep_id)
  end

  def user_owns_resource
    resource = Resource.find(params[:resourcery][:resource_id])
    if current_user != resource.user
      flash[:alert] = "You don't have permission to do that"
      redirect_back(fallback_location: root_path)
    end
  end

end
