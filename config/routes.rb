Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'user/registrations',
      sessions: 'user/sessions'
  }
  root 'home#index'
  resources :home, only: [:index, :show]
  resources :friendships, only: [:create]
  post '/confirm_friends', controller: :friendships, action: :confirm, as: :confirm_friendship
end
