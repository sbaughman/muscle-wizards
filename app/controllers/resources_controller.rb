class ResourcesController < ApplicationController

  def index
  end

  def show

  end

  def new
  end

  def create
  end

  def edit
  end

  def jam
  end

  def update
  end

  def destroy
  end

  def resource_params
    params.require(:resource).permit(:title, :body, :url)
  end
end
