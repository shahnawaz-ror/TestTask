# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users do
  	resources :transactions
  end
  devise_for :users
  root 'users#index'
end
