Rails.application.routes.draw do
  resources :symptoms do
    resources :medications
    resources :moods
    resources :foods
    resources :drinks
  end

  devise_for :users

  resources :user
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'symptoms#index'
end
