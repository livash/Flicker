class TaggingsController < ApplicationController
  before_filter :authenticate_user!
  
  def destroy
    @tagging = Tagging.find(params[:id])
    @tagging.destroy
    render :json => nil
  end
end
