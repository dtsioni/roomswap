Rails.application.routes.draw do

  root 'pages#home'

  resources :users
  resources :universities, only: [:show]

  match 'signup', to: 'users#new', via: 'get'

  get 'help', to: 'pages#help'
  get 'contact', to: 'pages#contact'

end
