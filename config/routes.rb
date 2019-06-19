Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dish_availabilities#index'

  resources :dishes, only: [:index, :show, :new, :create]

  resources :dish_availabilities do
    resources :orders
  end

  resources :users

  get '/dashboard', to: "pages#dashboard"
  get '/make_chef', to: 'users#make_chef', as: 'make_chef'

end
