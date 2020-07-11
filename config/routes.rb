Rails.application.routes.draw do
  resources :posts

  root to: 'page#home'
  get 'post/new'


  devise_for :users

resource :users, only: [:show]
end
