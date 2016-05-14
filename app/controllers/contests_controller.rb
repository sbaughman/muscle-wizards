class ContestsController < ApplicationController
  before_action :require_user
  before_action :set_prep
  before_action :user_owns_prep

  def index
    @contests = @prep.contests.order(created_at: :desc)
  end

  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.new(contest_params)
    @contest.prep = @prep
    if @contest.save
      flash[:success] = "Contest created!"
      redirect_to prep_path(@contest.prep)
    else
      render :new
    end
  end

  def contest_params
    params.require(:contest).permit(:title, :date)
  end

end
