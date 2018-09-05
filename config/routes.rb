require 'resque/server'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Resque::Server, at: '/jobs'
  root controller: :players, action: :index
  resources :players
  resources :loader_jobs, only: [:new]
  resources :destroyer_jobs, only: [:new]
  resources :all_time_leaders, only: [:index]
  resources :teams, only: [:index, :show]
end
