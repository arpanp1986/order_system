Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get 'vegetables', to: 'vegetables#index'
  # get 'vegetables/new', to: 'vegetables#new', as: 'new_vegetable'
  # get 'vegetables/:id', to: 'vegetables#show', as: 'vegetable'
  # post 'vegetables', to: 'vegetables#create'
  # put 'vegetables/:id', to: 'vegetables#update'
  # delete 'vegetables/:id', to: 'vegetables#destroy'

  resources :vegetables
end
