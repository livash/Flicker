class AlbumsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @albums = current_user.albums
  end

  def show
    @album = Album.find(params[:id])
    if @album
      render :show
    else
      @albums = current_user.albums
      render :index
    end
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      current_user.albums << @album
      redirect_to albums_url
    else
      redirect_to albums_url
    end
  end
  
  def update
    @album = Album.find(params[:id])
    redirect_to albums_url if !current_user.albums.include?(@album)
    @album.photo_ids = @album.photo_ids << params[:photo_id]
    if @album.save
      render :json => @album
    else
      redirect_to albums_url
    end
  end
  
  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    render :json => nil
  end
end
