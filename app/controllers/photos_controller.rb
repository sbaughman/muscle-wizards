class PhotosController < ApplicationController
  before_action :set_prep
  before_action :set_scope, only: [:index]

  def index
    @photos = @scope.order(created_at: :desc)
    @tags = Tag.all
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

  def set_scope
    if params[:tag]
      tag = Tag.find_by(name: params[:tag])
      @scope = tag.photos.where(prep_id: params[:prep_id])
    else
      @scope = @prep.photos
    end
  end

end
