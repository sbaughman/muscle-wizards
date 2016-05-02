class BodyweightsController < ApplicationController
  before_action :set_prep

  def index
    @weights = @prep.bodyweights.order(created_at: :desc)
  end

  def new
    @weight = Bodyweight.new
  end

  def create
    @weight = Bodyweight.new(weight_params)
    if @weight.save
      flash[:success] = "Weigh-in successful"
      redirect_to prep_path(@weight.prep)
    else
      render :new
    end
  end

  private

  def weight_params
    params.require(:bodyweight).permit(:weight)
  end

end
