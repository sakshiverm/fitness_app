require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  root "dashboards#index"
  # devise_scope :user do
  #   root to: "devise/ragistrations#new"
  # end
  resources :challenges
  resources :goals
  resources :fitness_activities
  resources :workout_plans do
    resources :exercises
  end
  mount Sidekiq::Web => '/sidekiq'
end
