Rails.application.routes.draw do

   devise_for :users

resources :users, only: [:update, :show, :index] do
    resources :friendships, only: [:create, :destroy]
   end

    resources :users do
     member do
      get :following, :followers
     end
    end

    resources :topics do
     resources :posts, except: [:index], controller: 'topics/posts'
   end

  resources :posts, only: [:index] do
    resources :comments, only: [:create, :destroy]
   end
  
  resources :relationships, only: [:create, :destroy]
  
   get 'about' => 'welcome#about'

  authenticated :user do
    root to: 'topics#index', as: 'authenticated_root'
  end
  
   root to: 'welcome#index'

 end