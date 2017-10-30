Rails.application.routes.draw do
  

  resources :authors
  root 'static#home'
  resources :regions, only: [:index, :show, :edit, :update]
  resources :countries, only: [:index, :show, :edit, :update]

end
