Rails.application.routes.draw do
  root 'static#home'

  devise_for :users
  resources :books
  resources :authors
  resources :regions, only: [:index, :show, :edit, :update]
  resources :countries

end
