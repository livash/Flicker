class HomeController < ApplicationController
  def index
  end
  
  def show
    @photos = Photo.all
  end
end
