Rails.application.routes.draw do
  # resources :reservations
  resources :restaurants do
    resources :reservations, only: [:create, :destroy]
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'restaurants#index'
end
