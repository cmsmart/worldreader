Rails.application.routes.draw do

  root 'static#home'
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  resources :profiles do
    get '/my-books' => 'profiles#my_book'
    get '/my-countries' => 'profiles#my_country'
  end

  resources :publishers #publisher profile

  resources :books
  resources :authors
  resources :regions, only: [:index, :show, :edit, :update]
  resources :countries

  # registraton
  get '/publisher_registration' => 'registration#new'
  post '/publisher_registration' => 'registration#create'

  # favourite books
  post '/favourite_book', to: 'favourite_books#favourite_book'
  delete '/unfavourite_book', to: 'favourite_books#unfavourite_book'
  
  # Want to read  - Reading List
  post '/reading_list', to: 'reading_lists#reading_list'
  delete '/remove_reading_list', to: 'reading_lists#remove_reading_list'

  # Have read
  post '/read', to: 'reads#read'
  delete '/unread', to: 'reads#unread'
end
