Rails.application.routes.draw do

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root :to => 'events#index'

  devise_for :users

  resources :users do
    resources :events
  end

  resources :events

  resources :events do
    resources :menus
  end

  resources :events do
    resources :reviews
  end

  resources :menus
  resources :admins
  resources :reviews
  resources :desserts
  resources :antipastis
  resources :mains
  resources :pasta_dishes
  resources :wines
  resources :styles
  resources :bites
end
