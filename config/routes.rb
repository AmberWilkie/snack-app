Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'user/registrations'
  }
  root 'home#index'
  resources :home, only: [:index, :show]
  resources :friendships, only: [:create]
end
