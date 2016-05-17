class CardiosController < ApplicationController
  before_action :require_user
  before_action :set_prep
  before_action :user_owns_prep

    def index
      @cardios = @prep.cardios.order(created_at: :asc)
      if @cardios.length > 10
        @over_ten = true
        @chart_cardios = @cardios[-10..-1].reverse
      end
      if params[:m]
        @over_ten = false
        @chart_cardios = @cardios.reverse
      end
    @target_cardios = @prep.target_cardios.order(created_at: :asc)
      if @target_cardios.length > 10
        @over_ten2 = true
        @chart_target_cardios = @target_cardios[-10..-1].reverse
      end
      if params[:tm]
        @over_ten2 = false
        @chart_target_cardios = @target_cardios.reverse
      end
      @minmax = (@cardios.map { |cardio| cardio.duration} + @target_cardios.map { |cardio| cardio.duration }).minmax
    end

    def new
      @cardio = Cardio.new
    end

    def create
      @cardio = Cardio.new(cardio_params)
      @cardio.prep = @prep
      if @cardio.save
        flash[:success] = "Cardio added!"
        redirect_to prep_path(@cardio.prep)
      else
        render :new
      end
    end

    private

    def cardio_params
      params.require(:cardio).permit(:duration, :activity, :style)
    end
end
