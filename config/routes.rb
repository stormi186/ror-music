Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/signup', to: 'users#new'

  namespace :admin do
    resource :dashboard, only: [:show]
    resources :tracks
    resources :artists
    resources :genres
    resources :albums
  end

  namespace :superadmin do
    resource :dashboard, only: [:show]
    resources :tracks
    resources :albums
    resources :genres
    resources :artists
  end

  resources :users, only: [:new, :create]
  resources :albums, only: [:index, :show]
  resources :artists, only: [:index, :show]
  resources :favorite_tracks, only: [:create, :destroy]
  resources :favorites, only: [:index, :destroy]
  resources :playlists
  resources :tracks, only: [:index, :show]
  resources :genres, only: [:index, :show]
  resources :track_playlists, only: [:create, :destroy]

  #resource :session, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
