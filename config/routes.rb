Rails.application.routes.draw do
  get 'entries/index'
  get 'pages/index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # resources :users, only: %i[timeline insight] do
  get '/timeline', to: 'users#timeline', as: 'timeline'
  get '/analysis', to: 'users#insight', as: 'symptom_analysis'
  get '/popup', to: 'users#popup'
  # end
  resources :symptoms
  resources :medications
  resources :moods
  resources :foods
  resources :drinks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#index'
end
