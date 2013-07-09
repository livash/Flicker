class GalleriesController < ApplicationController
  
  def index
    @galleries = Gallery.all #.map { |g| g.photos.count > 0 }
  end
  
  def show
    
  end
  
end
