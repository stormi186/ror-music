Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/signup', to: 'users#new'

  namespace :admin do
    resource :dashboard, only: [:show]
    resources :products
  end

  resources :users, only: [:new, :create]
  resources :albums
  resources :artists
  resources :favorites
  resources :playlists
  resources :tracks do
  	put :favorite, on: :member
  end
  resources :genres
  resources :artist_tracks
  resources :playlist_tracks

  #resource :session, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
