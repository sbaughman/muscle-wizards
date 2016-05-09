class UsersController < ApplicationController
  before_action :require_user

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
