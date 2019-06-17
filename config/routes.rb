Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dishes#index'

  resources :dishes, only: [:index, :show, :new, :create]


end
