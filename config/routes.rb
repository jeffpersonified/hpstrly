Shortener::Application.routes.draw do
  devise_for :users

  resources :users
  resources :urls

  root :to => 'urls#index'

  match ':short_url' => 'urls#show'
end
