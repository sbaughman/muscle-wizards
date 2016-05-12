class ResourceriesController < ApplicationController
  before_action :require_user

  def create
    @resourcery = Resourcery.create!(resourcery_params)
    flash[:success] = "Resource successfully shared"
    redirect_to :back
  end

  private

  def resourcery_params
    params.require(:resourcery).permit(:resource_id, :prep_id)
  end

end
