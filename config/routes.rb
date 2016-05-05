Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :preps do
    resources :contests
    resources :photos
    resources :cardios
    resources :target_cardios
    resources :macros
    resources :target_macros
    resources :bodyweights
  end

  root 'preps#index'
  get 'preps/:prep_id/photos/poses/:tag' => 'photos#index', as: :pose
  get '/auth/facebook/callback' => 'users#show'

end
