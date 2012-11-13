Shortener::Application.routes.draw do
  devise_for :users

  # resources :users
  resources :urls, :except => [:update, :destroy, :edit, :show]

  root :to => 'urls#index'

  match ':short_url' => 'urls#show'
end
