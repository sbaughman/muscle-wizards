class CardiosController < ApplicationController
  before_action :set_prep

    def index
      @cardios = @prep.cardios.order(created_at: :desc)
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
      params.require(:cardio).permit(:duration, :type, :style)
    end
end
