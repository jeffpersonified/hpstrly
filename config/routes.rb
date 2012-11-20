Shortener::Application.routes.draw do
  devise_for :users

  resources :urls, :except => [:update, :destroy, :edit, :show]

  root :to => 'urls#index'

  get ':short_url' => 'urls#show', :as => 'url'
end
