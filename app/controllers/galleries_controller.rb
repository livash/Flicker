class GalleriesController < ApplicationController
  
  GALLERY_MAX = 20
  
  def index
    @galleries = Gallery.all #.map { |g| g.photos.count > 0 }
  end
  
  def show
    @gallery = Gallery.find(params[:id])
    @photos = @gallery.photos
    render  :show
  end
  
  def update
    @gallery = Gallery.find(params[:id])
    @gallery_photo = GalleryPhoto.new(params[:gallery_photo])
    #allow
    if @gallery.gallery_photos.length < GALLERY_MAX
      @gallery.gallery_photos << @gallery_photo
      @gallery.save
      render :json => @gallery_photo 
    else
      render :json => nil 
    end
  end
end
