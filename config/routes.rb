Rails.application.routes.draw do

  get 'home' => 'static_pages#home', as: :home
  get 'about' => 'static_pages#about', as: :about

  devise_for :users
  resources :users do
    resources :philosophies, only: [:new, :create, :update, :edit]
    resources :certifications, only: [:new, :create, :update, :edit, :destroy]
  end
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
  get 'preps/:prep_id/self_coach' => 'preps#self_coach', as: :selfie
  get 'preps/:prep_id/coaches' => 'users#index', as: :coaches
  get 'preps/:prep_id/coach/:id' => 'users#show', as: :coach
end
