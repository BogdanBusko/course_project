Rails.application.routes.draw do
  get 'category/show/:id', to: 'category#show', as: 'category'

  root 'main#index'
end
