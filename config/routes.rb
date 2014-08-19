Driven::Application.routes.draw do
  get "friendship/create"
  get "friendship/destroy"
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get '/users/:id', to: 'users#index'
  root to: "sessions#index"
end