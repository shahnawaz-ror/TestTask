# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :users do
    resources :transactions
  end
  root 'home#index'
end
