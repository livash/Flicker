class TagsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @tags = current_user.tags
    render :json => @tags
  end
  
  def create
    @tag = Tag.new(params[:tag])
    @tag.taggings.build(params[:tagging])
    if @tag.save
      render :json => @tag.taggings.last
    else
      render :json => @tag.taggings # think about what to do if tag already exists and user tries to add it gain
    end
  end
  
  def destroy
    @tag = Tag.find(params[:id])
    if current_user.tags.include?(@tag)
      @tag.destroy
      render :json => nil
    else
      render :json => nil
    end
  end
  
  def search
    # user can send two tag search
    @search_tags = params[:tag][:title].split(' ');
    @photos = []
    @search_tags.each do |tag|
      @tag = Tag.find_by_title(tag)
      @photos << @tag.photos
    end
    puts "photo count ..............."
    puts @photos.count
    render :search
  end
  
  def update
    
  end
end
