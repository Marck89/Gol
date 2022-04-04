Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #get '/' => 'gameoflife#list'
  #devise_for :users
  resources :users
  get '/' => 'gameoflife#index'
  post '/init' => 'gameoflife#init'
   
  
end
