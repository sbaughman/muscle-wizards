class BodyweightsController < ApplicationController
  before_action :require_user
  before_action :set_prep
  before_action :user_owns_prep
  before_action :multiply_by_ten, only: [:create]


  def index
    @weights = @prep.bodyweights.order(created_at: :asc)
    @chart_weights = @weights.reverse
    if @weights.length > 10
      @over_ten = true
      @chart_weights = @weights[-10..-1].reverse
    end
    if params[:m]
      @over_ten = false
      @chart_weights = @weights.reverse
    end
  end

  def new
    @weight = Bodyweight.new
  end

  def create
    @weight = @prep.bodyweights.new(weight_params)
    if @weight.save
      flash[:success] = "Weigh-in successful"
      redirect_to @prep
    else
      render :new
    end
  end

  private

  def weight_params
    params.require(:bodyweight).permit(:weight)
  end

  def multiply_by_ten
    weight = params[:bodyweight][:weight]
    params[:bodyweight][:weight] = weight.to_f * 10
  end

end
