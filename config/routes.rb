Rails.application.routes.draw do
  

  
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' 
    get 'users/:id' => 'users#show'
  end
  
  resources :users, only: [:update, :show, :index] do
    resources :friendships, only: [:create, :destroy]
    resource :wall
  end

   resources :users do
     member do
      get :following, :followers
     end
   end
   
  resources :users do
    resources :pages
    resources :collaborations
  end

  resources :pages do
    resources :documents
    resources :comments
  end
  resources :posts do
    resources :comments
  end

  resources :users do
    member do
      get :supporting, :supporters
    end
  end
 
  resources :collaborations, only: [:create, :destroy]

  resource :wall do
    resource :topics
    resources :posts
  end
  
  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts'
    resource :wall
  end
  
  resources :posts, only: [:index] do
    resources :comments, only: [:create, :destroy]
    resource :wall
  post '/up-vote' => 'votes#up_vote', as: :up_vote
  post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  resources :todoos
  resources :subscribe
  resources :relationships, only: [:create, :destroy]
  resources :votes, only: [:create]
  resources :comments
  resources :documents
  

  get 'about' => 'welcome#about'
 
 authenticated :user do
    root 'topics#index', as: 'authenticated_root'
  end
 
  root to: 'welcome#index'

  
end

