Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :users

  scope '/profiles' do
    match '/:id', to: 'profile_pages#show', as: "show_profile", via: [:get]
  end
end
