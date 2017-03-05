Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'user/registrations',
      sessions: 'user/sessions'
  }
  resources :conversations, only: [:index] do
    resources :messages, only: [:index, :new, :create]
  end
  root 'home#index'
  resources :home, only: [:index, :show]
  resources :friendships, only: [:create]
  post '/confirm_friends', controller: :friendships, action: :confirm, as: :confirm_friendship
  get '/matches', controller: :home, action: :matches, as: :matches

  mount Thredded::Engine => '/forum'
end
