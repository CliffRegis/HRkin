Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:update, :show, :index]
  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts'
  end
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  
  get 'about' => 'welcome#about'
 
  root to: 'welcome#index'
  
end
