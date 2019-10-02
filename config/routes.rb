Rails.application.routes.draw do
  resources :player_signups
  resources :listings
  resources :users
  resources :activities
  resources :venues
  resources :areas
  # param: :slug
  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  root 'welcome#home'

  # get '/activities/:slug', to: 'activities#show', as: 'activity'
  # get '/activities/:slug/edit', to: 'activities#edit', as: 'edit_activity'
  # patch 'activities/:slug', to: 'activities#update'

  # get '/users/:slug', to: 'users#show', as: 'user'
  # get '/users/:slug/edit', to: 'users#edit', as: 'edit_user'
  # patch '/users/:slug', to: 'users#update'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
