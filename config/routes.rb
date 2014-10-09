Rails.application.routes.draw do

  root 'pages#home'

  resources :users
  resources :universities, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]

  match 'signup', to: 'users#new', via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  get 'help', to: 'pages#help'
  get 'contact', to: 'pages#contact'

end
