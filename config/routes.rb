Rails.application.routes.draw do
  resources :player_signups
  resources :listings
  resources :users
  resources :activities
  resources :venues
  resources :areas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
