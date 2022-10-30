Rails.application.routes.draw do
  get 'entries/index'
  get 'pages/index'
  resources :symptoms
    resources :medications
    resources :moods
    resources :foods
    resources :drinks

  devise_for :users

  resources :user
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#index'
end
