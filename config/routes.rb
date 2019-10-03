Rails.application.routes.draw do
  get 'admins/scaffold'
  resources :player_signups, only: [:delete]
  resources :listings
  resources :users
  resources :activities
  resources :venues
  resources :areas, only: [:index, :show] 
  namespace :admin do
    resources :users, only: [:delete]
    resources :venues, only: [:delete]
    resources :activities
    resources :areas
    resources :listings
  end

  post 'listings/:id', to: 'listings#join', as: 'join_listing'
  post 'player_signups/:id', to: 'listings#remove_player', as: 'delete_player_signup'


  # param: :slug
  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  root 'welcome#home'

  get '/users/:id/edit_password', to: 'user#edit_password', as: 'edit_user_password'
  patch '/users/:id', to: 'user#edit_password'

  # get '/activities/:slug', to: 'activities#show', as: 'activity'
  # get '/activities/:slug/edit', to: 'activities#edit', as: 'edit_activity'
  # patch 'activities/:slug', to: 'activities#update'

  # get '/users/:slug', to: 'users#show', as: 'user'
  # get '/users/:slug/edit', to: 'users#edit', as: 'edit_user'
  # patch '/users/:slug', to: 'users#update'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
