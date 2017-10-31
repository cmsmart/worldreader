Rails.application.routes.draw do
  

  resources :books
  resources :authors
  root 'static#home'
  resources :regions, only: [:index, :show, :edit, :update]
  resources :countries

end
