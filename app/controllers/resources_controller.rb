class ResourcesController < ApplicationController
  before_action :require_user

  def index
    set_scope
    @resourcery = Resourcery.new
    @preps = Prep.where("coach_id = ?", current_user.id)
  end

  def show
    set_prep if params[:prep_id]
    @resource = Resource.find(params[:id])
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.user = current_user
    if @resource.save
      flash[:success] = "You have made resources great job!"
      redirect_to user_resources_path(current_user)
    else
      render :new
    end
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def jam
  end

  def update
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    redirect_to user_resources_path(current_user)
  end

  def resource_params
    params.require(:resource).permit(:title, :body, :url, :upload)
  end

  def set_scope
    if params[:prep_id]
      @resources = set_prep.resources
    else
      @resources = current_user.resources
    end
  end

end
