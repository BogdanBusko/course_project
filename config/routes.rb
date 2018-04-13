Rails.application.routes.draw do
  devise_for :users

  get 'category/show/:id', to: 'categories#show', as: 'category'

  resources :courses
  resources :publications, only: [:index]

  root 'courses#index'
end
