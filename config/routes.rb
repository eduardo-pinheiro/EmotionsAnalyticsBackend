# frozen_string_literal: true

Rails.application.routes.draw do
  post "/test_type", to: "test_type#create"
  get "/test_type/:id", to: "test_type#show"
  get "/test_type", to: "test_type#index"
  patch "/test_type/:id", to: "test_type#update"

  post  '/people_appearance',     to: 'people_appearance#create'
  get   '/people_appearance/:id', to: 'people_appearance#show'
  get   '/people_appearance',     to: 'people_appearance#index'
  patch '/people_appearance/:id', to: 'people_appearance#update'

  post  '/people',     to: 'people#create'
  get   '/people/:id', to: 'people#show'
  get   '/people',     to: 'people#index'
  patch '/people/:id', to: 'people#update'

  resources :tests, only: %i[index show create update]
  resources :emotions, only: %i[index show create update]
  resources :expressions, only: %i[index show create update]
  resources :occurrences, only: %i[index show create update]

  get "/graph/emotions/:id", to: "graph/emotions#generate"
end
