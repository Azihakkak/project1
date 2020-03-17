Rails.application.routes.draw do

  root :to => 'pages#home'
  resources :users, :only => [:new, :create, :show, :edit, :update]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :posts
  resources :comments

end
