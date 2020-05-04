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
   end
 end
 
 resources :pockets
 resources :knowhows
 
 resources :relationships, only: [:create, :destroy]
 end
