class TagsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      render :json => @tag
    else
      render :json => @tag.errors.full_messages, :status => 422
    end
  end
end
