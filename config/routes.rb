Rails.application.routes.draw do
  get 'votes/new'
  get 'votes/create'
  get 'votes/destroy'
  get 'categories/new'
  get 'categories/index'
  get 'categories/show'
  get 'sessions/log_in'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: %i[new create log_in destroy]
  resources :users, only: %i[new create show]
  resources :articles, only: %i[new create index show]
  root "categories#index"
end
