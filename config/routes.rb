Rails.application.routes.draw do
  root 'static#home'
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  resources :profiles

  resources :books
  resources :authors
  resources :regions, only: [:index, :show, :edit, :update]
  resources :countries

end
