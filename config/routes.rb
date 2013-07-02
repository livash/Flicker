Flickr::Application.routes.draw do
  devise_for :users

  resources :photos do 
    get "serve", :on => :member
  end

  resources :albums, :collections
  root to: "photos#index"
end
