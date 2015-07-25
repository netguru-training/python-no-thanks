Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  get '/profiles/:id', to: 'profile_pages#show', as: 'show_profile'
  resources :users
  resources :galleries do
    member do
      resources :images
    end
  end
end
