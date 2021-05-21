Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users
      post 'users/login', to: 'sessions#create'
    end
  end
end
