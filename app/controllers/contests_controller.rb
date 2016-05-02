class ContestsController < ApplicationController

  def index
    @prep = Prep.find(params[:prep_id])
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
    params.require(:contest).permit(:image)
  end

end
