class ResourcesController < ApplicationController
  before_action :require_user

  def index
    set_scope
    @resourcery = Resourcery.new
    @preps = Prep.where("coach_id = ?", current_user.id)
  end

  def show
    @resource = Resource.find(params[:id])
    if params[:prep_id]
      set_prep
      @resourcery = @resource.resourceries.find_by(prep_id: @prep.id)
      @resourcery.update(read: true)
    end
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
