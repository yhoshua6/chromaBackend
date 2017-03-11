Rails.application.routes.draw do
  post '/login' => 'application#login'
  post '/forgot_password' => 'application#forgot_password'
  post '/confirm_account' => 'application#confirm'
  post '/send_comments' => 'application#user_comments'
  namespace :api do
    namespace :v1 do
      resources :groups_users
      resources :groups
      resources :notifications_roles
      resources :branches
      resources :previous_owners
      resources :depot_files
      resources :info_users
      resources :info_properties
      resources :images
      resources :notifications
      resources :property_types
      resources :properties
      resources :users_roles
      resources :users
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
