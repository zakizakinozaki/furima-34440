Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index, :new, :create, :show, :edit, :update] do
    resources :purchases, only: [:index, :create]
  end
end
