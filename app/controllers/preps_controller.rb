class PrepsController < ApplicationController

  def index
    @preps = Prep.all
  end

  def new
    @prep = Prep.new
  end

  def create
    @prep = Prep.new(prep_params)
    if @prep.save
      flash[:success] = "New Contest Prep started. Good luck!"
      redirect_to prep_path(@prep)
    else
      render :new
    end
  end

  def show
    @prep = Prep.find(params[:id])
    @photos = @prep.photos.order(created_at: :desc).limit(3)
  end

  private

  def prep_params
    params.require(:prep).permit(:title)
  end

end
