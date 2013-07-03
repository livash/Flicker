class AlbumsController < ApplicationController
  before_filter :user_signed_in?

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
    if @album
      render :show
    else
      @albums = Album.all
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
    @album.photo_ids += params[:photo_id]
    if @album.save
      redirect_to albums_url
    else
      redirect_to albums_url
    end
  end
end
