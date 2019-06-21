Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'dish_availabilities#index'
  root to: 'pages#home'

  resources :dishes, only: [:index, :show, :new, :create] do
    resources :dish_availabilities, only: [:new, :create]
  end

  resources :dish_availabilities, only: [:index, :show] do
    resources :orders
  end

  resources :users

  get '/dashboard', to: "pages#dashboard"
  get '/make_chef', to: 'users#make_chef', as: 'make_chef'
  get '/chef_page', to: 'pages#chef_page', as: 'chef_page'


end
