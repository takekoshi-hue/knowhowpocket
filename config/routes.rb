Rails.application.routes.draw do
 
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
   end
 end
 

 resources :pockets, only: [:destroy, :new, :edit, :update, :create] do
  member do
    get :knowhows 
   end
  end
 resources :knowhows
 
 resources :relationships, only: [:create, :destroy]
 end
