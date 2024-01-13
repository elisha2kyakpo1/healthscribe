Rails.application.routes.draw do
  get '/entries', to: 'entries#index'
  get 'pages/index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/timeline', to: 'users#timeline', as: 'timeline'
  get '/symptoms_analysis', to: 'users#insight', as: 'symptom_analysis'
  get '/popup', to: 'users#popup'
  get '/hovercard', to: 'users#hovercard', as: 'hovercard'
  resources :symptoms
  resources :medications
  resources :moods
  resources :foods
  resources :drinks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#index'
end
