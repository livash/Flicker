Flickr::Application.routes.draw do
  devise_for :users

  resources :albums, :only => [:index, :new, :create]

  resources :albums do
    resources :photos, :only => [:show, :serve]
  end
  
  resources :collections
  resources :comments
  resources :galleries
  # resource :photos do
  #   get 'gallery'
  # end
  resources :photos 
  resources :tags, :only => [:create, :index, :destroy]
  resource :tags do
    get 'search'
  end
  resources :taggings# , :only => :destroy
  
  resources :galleries

  #resource :home, :only => :show
  resources :home, :only => [:index, :show]

  root to: "galleries#index"
end
