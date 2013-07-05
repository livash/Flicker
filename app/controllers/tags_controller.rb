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
  
  def update
    
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
end
