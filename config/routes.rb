Flickr::Application.routes.draw do
  devise_for :users

  resources :albums, :collections
 
  resources :photos do 
    get "serve", :on => :member
  end
  
  resources :albums do
    resources :photos
  end

  root to: "photos#index"
end
