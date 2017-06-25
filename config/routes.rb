Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  authenticated :admin do
    namespace :admin do
      root 'tasks#index'
      resources :admins
      resource :dashboard, only: %i[show], controller: :dashboard
      resources :tasks, only: %i[index show update] do
        resources :comments, only: %i[new create]
      end
      resources :users, only: %i[index show new create]
    end
  end

  authenticated :user do
    root 'tasks#index'
    resources :users, only: %i[show]
    resource :dashboard, only: %i[show], controller: :dashboard
    resources :tasks, only: %i[index new show create] do
      resources :comments, only: %i[new create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :tasks, only: %i[index show create] do
        resources :comments, only: %i[index show create]
      end
    end
  end

  root 'static_pages#home'
end
