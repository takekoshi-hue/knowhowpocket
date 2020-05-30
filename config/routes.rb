Rails.application.routes.draw do
 
  get 'favorites/create'
  get 'favorites/destroy'
 root to: "toppages#index"
 
 get "login", to: "sessions#new"
 post "login", to: "sessions#create"
 delete "logout", to: "sessions#destroy"
 
 get "signup", to: "users#new"
 resources :users, only: [:show, :new, :create, :edit, :update] do
   member do
     get :followings
     get :followers
     get :pockets 
     get :likes
   end
 end

 resources :pockets, only: [:destroy, :update, :edit, :create] do
  member do
    get :knowhows 
    get :posted_knowhows
    
   end
  end
 resources :knowhows, only: [:destroy, :update, :edit, :create, :show] do
 member do
  post '/knowhow_posted' => 'knowhows#knowhow_posted'
 end
end
 
 resources :relationships, only: [:create, :destroy]
 resources :favorites, only: [:create, :destroy]
 end
