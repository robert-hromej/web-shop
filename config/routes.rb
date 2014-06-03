Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'main#index'

  resources :categories do
    resources :products
  end

  resources :products

  resources :customers do
    get :login, on: :collection
    post :authorization, on: :collection
  end

end
