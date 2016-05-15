class ResourcesController < ApplicationController
  before_action :require_user

  def index
    @resources = current_user.resources
    @preps = Prep.where(coach_id: current_user.id)
  end

  def show
    @resource = Resource.find(params[:id])
    if params[:prep_id]
      set_prep
      @resourcery = @resource.resourceries.where(prep_id: @prep.id)
      @resourcery.update(read: true) if current_user == @prep.athlete
    end
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.user = current_user
    if @resource.save
      flash[:success] = "New resource saved!"
      redirect_to user_resources_path(current_user)
    else
      render :new
    end
  end

  def edit
    @resource = Resource.find(params[:id])
  end


  def update
    @resource = Resource.find(params[:id])
    if @resource.update_attributes(resource_params)
      flash[:success] = "Resource updated successfully"
      redirect_to user_resources_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    redirect_to user_resources_path(current_user)
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :body, :url, :upload)
  end

end
