Rails.application.routes.draw do
  get 'api/v1/users', to: 'users#index'
  get 'api/v1/users/:id', to: 'users#show', as: 'user'
  post 'api/v1/users', to: 'users#create'
  put 'api/v1/users/:id', to: 'users#update'
  delete 'api/v1/users/:id', to: 'users#destroy'
  post 'api/v1/users/login', to: 'users#login'
end
