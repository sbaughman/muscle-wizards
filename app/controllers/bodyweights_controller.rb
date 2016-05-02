class BodyweightsController < ApplicationController

  def index
    @weights = Bodyweight.all(created_at: :desc)
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
