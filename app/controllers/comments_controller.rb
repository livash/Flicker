class CommentsController < ApplicationController
   before_filter :authenticate_user!
  
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      render :json => @comment
    else
      render :json => nil
    end
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment
      @comment.update_attributes(params[:comment])
      render :json => @comment
    else
      render :json => nil
    end  
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if current_user.comments.include?(@comment)
      @comment.destroy
      render :json => nil
    else
      render :json => nil # semd some error message
    end
  end
  
end
