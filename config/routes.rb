Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:update, :show, :index] do
    resources :friendships, only: [:create, :destroy]
    resource :wall, only: [:show]
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
    resource :wall, only: [:show]
  post '/up-vote' => 'votes#up_vote', as: :up_vote
  post '/down-vote' => 'votes#down_vote', as: :down_vote
 
  end

  resources :relationships, only: [:create, :destroy]
  resources :votes, only: [:create]
  resources :comments
  
  get 'about' => 'welcome#about'
 
  root to: 'welcome#index'
  
end


