Rails.application.routes.draw do

  get 'home' => 'static_pages#home', as: :home
  get 'about' => 'static_pages#about', as: :about

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

  root 'users#show'
  get 'preps/:prep_id/photos/poses/:tag' => 'photos#index', as: :pose
end
