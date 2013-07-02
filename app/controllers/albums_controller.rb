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
end
