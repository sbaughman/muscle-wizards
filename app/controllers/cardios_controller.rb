class CardiosController < ApplicationController
  before_action :set_prep

    def index
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
