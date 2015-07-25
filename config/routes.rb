Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  scope '/profiles' do
    match '/:id', to: 'profile_pages#show', as: "show_profile", via: [:get]
  end

  resources :users do
    resources :galleries
  end

end
