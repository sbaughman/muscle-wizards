class TargetCardiosController < ApplicationController
  before_action :require_user
  before_action :set_prep

  def index
    @target_cardios = @prep.target_cardios.order(created_at: :desc)
  end

  def new
    @target_cardio = TargetCardio.new
  end

  def create
    @target_cardio = TargetCardio.new(target_cardio_params)
    @target_cardio.prep = @prep
    if @target_cardio.save
      flash[:success] = "Cardio added!"
      redirect_to prep_path(@target_cardio.prep)
    else
      render :new
    end
  end

  private

  def target_cardio_params
    params.require(:target_cardio).permit(:duration, :activity, :style)
  end
end
