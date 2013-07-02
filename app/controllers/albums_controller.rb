class AlbumsController < ApplicationController

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

  def create
    @album = Album.new(params[:album])
    if @album.save
      redirect_to albums_url
    else
      redirect_to albums_url
    end
  end
end
