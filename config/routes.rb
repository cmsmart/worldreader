Rails.application.routes.draw do

  root 'static#home'
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  resources :profiles, only: [:show, :edit, :update]
  resources :publishers #publisher profile

  resources :books
  resources :authors
  resources :regions, only: [:index, :show, :edit, :update]
  resources :countries

  # registraton
  get '/publisher_registration' => 'registration#new'
  post '/publisher_registration' => 'registration#create'

end
