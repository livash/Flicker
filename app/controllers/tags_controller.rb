class TagsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @tags = current_user.tags
    render :json => @tags
  end
  
  def create
    @tag = Tag.where(:title => params[:tag][:title], :author_id => current_user.id)[0]
    if @tag
      tagging = Tagging.new(:tag_id => @tag.id, :photo_id => params[:tagging][:photo_id])
      @tag.taggings << tagging
      @tag.save
      render :json => @tag.taggings.last
    else
      @tag = Tag.new(params[:tag])
      @tag.save
      @tag.taggings.create(params[:tagging])
      render :json => @tag.taggings.last
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
    # user can send many tag search
    @search_tag_titles = params[:tag][:title].split(' ');
    @photos = []
    @search_tag_titles.each do |title|
      @tag = Tag.where(:title => title, :author_id => current_user.id)[0]
      @photos += @tag.photos if @tag
    end
    
    render :search
  end
  
  def update
    
  end
end
