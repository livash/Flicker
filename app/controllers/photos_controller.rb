class PhotosController < ApplicationController
  #before_filter :user_signed_in?

  def index
    @photos = current_user.photos
    respond_to do |format|
      format.html
      format.json { render :json => @photos }
    end
  end

  def new
    @photo = Photo.new
     render :new
  end

  def create
    @photo = Photo.new(params[:photo]) do |t|
      if params[:photo][:data]
       t.data  = params[:photo][:data].read
       t.filename     = params[:photo][:data].original_filename
       t.content_type = params[:photo][:data].content_type
      end
    end

    @photo.owner_id = current_user.id
    if @photo.save
      redirect_to photo_url(@photo)
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
    if @photo
      params[:album_id] ? @album = Album.find(params[:album_id]) : @album = nil
      @photo_previous, @photo_next = @photo.previous_next(@album)
      render :show
    else
      render :index
    end
  end

  def serve
    @photo = Photo.find(params[:id])
    send_data(@photo.data,
          :type => @photo.content_type,
          :filename => "#{@photo.filename}.jpg",
          :disposition => "inline")
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to(photos_url)
  end
end
