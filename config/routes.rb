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
    resources :areas, only: [:new, :create, :edit]
    resources :listings
  end

  post 'listings/:id', to: 'listings#join', as: 'join_listing'
  post 'player_signups/:id', to: 'listings#remove_player', as: 'delete_player_signup'


  # param: :slug
  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  root 'welcome#home'

  get '/users/:id/edit_password', to: 'users#edit_password', as: 'edit_user_password'
  patch '/users/:id', to: 'users#edit_password'

   # admin paths
  get '/admin', to: 'admins#index', as: 'admin'
  get '/admin/unauthorised_activities', to: 'admins#unauthorised_activities', as: 'unauthorised_activities'
  get '/admin/unauthorised_activities/:id/edit', to: 'admins#authorise', as: 'authorise_activity'
  patch 'admin/unauthorised_activities/:id', to: 'admins#update'
  delete 'admin/unauthorised_activities/:id', to: 'admins#delete'

  # get '/activities/:slug', to: 'activities#show', as: 'activity'
  # get '/activities/:slug/edit', to: 'activities#edit', as: 'edit_activity'
  # patch 'activities/:slug', to: 'activities#update'

  # get '/users/:slug', to: 'users#show', as: 'user'
  # get '/users/:slug/edit', to: 'users#edit', as: 'edit_user'
  # patch '/users/:slug', to: 'users#update'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
