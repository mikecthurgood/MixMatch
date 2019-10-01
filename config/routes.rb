Rails.application.routes.draw do
  resources :player_signups
  resources :listings
  resources :users
  resources :activities, only: [:create, :index, :update, :destroy, :new]
  resources :venues
  resources :areas
  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  root 'welcome#home'
  get '/activities/:slug', to: 'activities#show', as: 'activity'
  get '/activities/:slug/edit', to: 'activities#edit', as: 'edit_activity'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
