Rails.application.routes.draw do

  root to: 'products#index'

  # Routes for showing users a login form, logging them in, and logging them out
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Routes for showing visitors a signup form, and creating a new user
  get '/signup' => 'users#new'
  get '/users' => 'users#create'

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
  resources :about, only: [:index]

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, except: [:edit, :update, :show, :destroy]
  end

end
