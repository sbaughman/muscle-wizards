class CardiosController < ApplicationController

    def index
      @prep = Prep.find(params[:prep_id])
      @cardios = @prep.cardios.order(created_at: :desc)
    end

    def new
      @cardio = Cardio.new(cardio_params)
    end

    def create
    end

    private

    def cardio_params
      params.require(:cardio).permit(:duration, :type, :style)
    end
end
