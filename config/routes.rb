Rails.application.routes.draw do

  root 'pages#home'

  resources :users
  resources :universities, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :locations, only: [:new, :index, :create, :destroy]
  resources :swaps, only: [:new, :index, :create, :destroy, :show]

  match 'signup', to: 'users#new', via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  get 'help', to: 'pages#help'
  get 'contact', to: 'pages#contact'

end
