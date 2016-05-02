class PhotosController < ApplicationController
  before_action :set_prep

  def index
    @photos = @prep.photos.order(created_at: :desc)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.prep = @prep
    if @photo.save
      flash[:success] = "Photo created!"
      redirect_to prep_path(@photo.prep)
    else
      render :new
    end
  end

  def photo_params
    params.require(:photo).permit(:image)
  end

end
