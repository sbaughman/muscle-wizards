Rails.application.routes.draw do

  resources :contests
  resources :photos
  resources :cardios
  resources :macros
  resources :bodyweights
  resources :preps

  root 'preps#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
