# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :users, only: %i[index show] do
    resources :transactions
  end
  root 'home#index'
end
