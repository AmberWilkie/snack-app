Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
  root 'home#index'
  resources :home, only: [:index, :show]
end
