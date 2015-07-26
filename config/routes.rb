Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  get '/profiles/:id', to: 'profile_pages#show', as: 'show_profile'
  resources :users
  get '/images/new', to: 'images#new', as: 'new_image'
  post '/images', to: 'images#create', as: 'images'
  resources :galleries do
    resources :images, except: [:new, :create]
  end
end
