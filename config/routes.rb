Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      devise_for :users, path: 'users'
      resources :tasks
      resources :users, only: :show
      resources :servers, only: [:show, :index]
      resources :logs, only: :index
    end
  end
end