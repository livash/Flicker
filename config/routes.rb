Flickr::Application.routes.draw do
  devise_for :users

  resources :albums, :only => [:index, :new, :create]

  resources :photos 
  resources :tags, :only => [:create, :index, :destroy]
  resources :taggings# , :only => :destroy
  resources :collections
  
  resources :albums do
    resources :photos, :only => [:show, :serve]
  end
  
  resources :home, :only => :index

  root to: "home#index"
end
