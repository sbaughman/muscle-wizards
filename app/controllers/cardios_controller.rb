class CardiosController < ApplicationController
  before_action :set_prep

    def index
      @cardios = @prep.cardios.order(created_at: :desc)
      @target_cardios = @prep.target_cardios.order(created_at: :desc)
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
