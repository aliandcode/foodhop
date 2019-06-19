Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'dishes#index'
  root to: 'pages#home'

  resources :dishes, only: [:index, :show, :new, :create]

  resources :pages do
    collection do
      get 'home'
    end
  end

end
