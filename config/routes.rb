Flickr::Application.routes.draw do
  devise_for :users

  resources :albums, :only => [:index, :create]

  resources :photos do
    get "serve", :on => :member
  end
  resources :collections
  resources :albums do
    resources :photos, :only => [:show, :serve]
  end

  root to: "photos#index"
end
