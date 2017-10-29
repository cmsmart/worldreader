Rails.application.routes.draw do
  
  root 'static#home'
  resources :regions  

end
