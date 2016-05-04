class PhotosController < ApplicationController
  before_action :set_prep

  def index
    @photos = @prep.photos.order(created_at: :desc)
  end

  def new
    @photo = Photo.new
    @tags = Tag.all
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.prep = @prep
    if @photo.save
      create_tags unless params[:photo][:tag].blank?
      flash[:success] = "Photo created!"
      redirect_to prep_photos_path(@prep)
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end

  def create_tags
    Tagging.create(photo_id: @photo.id, tag_id: params[:photo][:tag])
  end

end
