Driven::Application.routes.draw do
  resources :friendships
  resources :users
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  
  root to: "sessions#index"
end