class UsersController < ApplicationController
  before_action :require_user

  def index
    @coaches = User.where(coach: true)
  end

  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def edit
    @user = current_user
  end

end
