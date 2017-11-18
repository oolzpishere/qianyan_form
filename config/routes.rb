Rails.application.routes.draw do
  resources :results
  resources :pages

  # post 'results/:subject', to: 'results#create'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"

  resource :invoices, only: [:show, :create]

  get '*path', to: 'pages#show'
end
