Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

 namespace :admin do
   resources :admins
   resources :tasks, only: %i[index show update]
   resources :comments, only: %i[new create]
   resources :users
 end

  namespace :api do
    namespace :v1 do
      resources :tasks, only: %i[index new create show]
      resources :comments, only: %i[index new create show]
    end
  end

  resources :tasks, only: %i[index new show create]
  resources :comments, only: %i[new create]


  root 'tasks#index'
end
