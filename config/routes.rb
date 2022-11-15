Rails.application.routes.draw do
  get 'entries/index'
  get 'pages/index'
  get 'entries/insight'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:show] do
    get 'users/:id', to: 'users#show', as: 'timeline'
    get 'users/:id/hovercard', to: 'users#hovercard', as: 'hovercard'
  end
  resources :symptoms
  resources :medications
  resources :moods
  resources :foods
  resources :drinks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#index'
end
