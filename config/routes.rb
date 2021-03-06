Rails.application.routes.draw do
  match '/404', to: 'errors#not_found', via: [:get, :post]
  match '/422', to: 'errors#unacceptable', via: [:get, :post]
	match '/500', to: 'errors#internal_server_error', via: [:get, :post]

	root 'home#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
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

  resources :users, only: [:new, :create, :show]
  resources :albums, only: [:index, :show]
  resources :artists, only: [:index, :show]
  resources :favorite_tracks, only: [:create, :destroy]
  resources :favorites, only: [:index, :create, :destroy]
  resources :playlists
  resources :tracks, only: [:index, :show]
  resources :genres, only: [:index, :show]
  resources :track_playlists, only: [:create, :destroy]
  resources :playlist_tracks, only: [:create, :destroy]
  resources :account_activations, only: [:edit]

end
