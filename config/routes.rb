Rails.application.routes.draw do
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  devise_for :admins
  devise_for :users

  resource :dashboard, only: %i[show], controller: :dashboard
  resources :comments, only: %i[new create]
  resources :tasks, only: %i[index new show create]

  namespace :admin do
    root 'dashboard#show'
    resources :admins
    resources :comments, only: %i[new create]
    resources :tasks, only: %i[index show update]
    resources :users
  end

  namespace :api do
    namespace :v1 do
      resources :comments, only: %i[index new create show]
      resources :tasks, only: %i[index new create show]
    end
  end
end
