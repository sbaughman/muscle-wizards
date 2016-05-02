class PhotosController < ApplicationController

  def index
    @prep = Prep.find(params[:prep_id])
    @photos = @prep.photos.order(created_at: :desc)
  end

  def new
    @photo = Photo.new(photo_params)
  end

  def create
  end

  def photo_params
    params.require(:photo).permit(:image)
  end

end
