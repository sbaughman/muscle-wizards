class UsersController < ApplicationController
  before_action :require_user

  def index
    @coaches = User.where(coach: true)
  end

  def show
    @prep = Prep.find(params[:prep_id])
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
      @coached_preps = Prep.where('coach_id = ? AND user_id != ?', current_user.id, current_user.id).order(updated_at: :desc)
    end
  end

  def edit
    @user = current_user
  end

end
