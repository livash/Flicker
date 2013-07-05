class TagsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @tags = current_user.tags
    render :json => @tags
  end
  
  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      render :json => @tag
    else
      render :json => @tag.errors.full_messages, :status => 422
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
end
