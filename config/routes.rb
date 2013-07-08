Flickr::Application.routes.draw do
  devise_for :users

  resources :albums, :only => [:index, :new, :create]

  resources :albums do
    resources :photos, :only => [:show, :serve]
  end
  
  resources :collections
  resources :comments
  resources :photos 
  resource :tags do
    get 'search'
  end
  resources :tags, :only => [:create, :index, :destroy]
  resources :taggings# , :only => :destroy
  
  

  
  resources :home, :only => :index

  root to: "home#index"
end
