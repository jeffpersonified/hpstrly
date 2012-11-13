Shortener::Application.routes.draw do

  root :to => 'urls#index'

  resources :urls

  match ':short_url' => 'urls#show'
end
