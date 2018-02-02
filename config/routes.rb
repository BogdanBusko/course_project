Rails.application.routes.draw do
  get 'category/show/:id', to: 'categories#show', as: 'category'
  get 'course/show/:id', to: 'courses#show', as: 'course'

  root 'courses#index'
end
