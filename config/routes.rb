Shortener::Application.routes.draw do

  devise_for :admins

  devise_for :users

  root :to => 'urls#index'
  
  resources :urls

  match ':short_url' => 'urls#show'
end
