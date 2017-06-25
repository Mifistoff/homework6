Rails.application.routes.draw do
  root 'static_pages#home'
  
  devise_for :admins
  devise_for :users

  authenticate(:user) do
    root 'dashboard#show'
    resource :dashboard, only: %i[show], controller: :dashboard
    resources :comments, only: %i[new create]
    resources :tasks, only: %i[index new show create]
  end

  authenticate(:admin) do
    namespace :admin do
      root 'dashboard#show'
      resources :admins
      resource :dashboard, only: %i[show], controller: :dashboard
      resources :comments, only: %i[new create]
      resources :tasks, only: %i[index show update]
      resources :users
    end
  end

  namespace :api do
    namespace :v1 do
      resources :comments, only: %i[index new create show]
      resources :tasks, only: %i[index new create show]
    end
  end
end
