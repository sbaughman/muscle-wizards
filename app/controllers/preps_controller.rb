class PrepsController < ApplicationController
  before_action :require_user

  def index
    @preps = Prep.all
  end

  def new
    @prep = Prep.new
    @prep.contests.build
  end

  def create
    @prep = Prep.new(prep_params)
    @prep.user = current_user
    if @prep.save
      flash[:success] = "New Contest Prep started. Good luck!"
      redirect_to prep_path(@prep)
    else
      render :new
    end
  end

  def show
    @prep = Prep.find(params[:id])
    @coach = User.find(@prep.coach_id) if @prep.coach_id
    @photos = @prep.photos.order(created_at: :desc).limit(3)
  end

  def self_coach
    @prep = Prep.find(params[:prep_id])
    @prep.coach_id = @prep.user_id
    @prep.save
    redirect_to prep_path(@prep)
  end

  private

  def prep_params
    params.require(:prep).permit(:title, contests_attributes: [:title, :date])
  end

end
