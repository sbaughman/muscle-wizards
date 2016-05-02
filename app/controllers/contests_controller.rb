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
    if @contest.save

    else

    end
  end

  def contest_params
    params.require(:contest).permit(:image)
  end

end
