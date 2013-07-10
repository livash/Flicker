class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(photos)
    photos_url
  end
end
