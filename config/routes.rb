Rails.application.routes.draw do
  get 'entries/index'
  get 'pages/index'
  get 'entries/insight'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:show] do
    get 'users/:id', to: 'users#show', as: 'timeline'
    get 'users/:id/hover_mood', to: 'users#hover_mood', as: 'hover_mood'
    get 'users/:id/hover_medication', to: 'users#hover_medication', as: 'hover_medication'
    get 'users/:id/hover_food', to: 'users#hover_food', as: 'hover_food'
    get 'users/:id/hover_symptom', to: 'users#hover_symptom', as: 'hover_symptom'
    get 'users/:id/hover_drink', to: 'users#hover_drink', as: 'hover_drink'
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
