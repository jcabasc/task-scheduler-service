Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      devise_for :users, path: 'users'
      resources :tasks
    end
  end
end