Rails.application.routes.draw do

devise_for :users

  root to: 'page#home'
  get 'post/new'
  get "users/:username" => "users#show", as: :account



  resources :posts do
    resource :comments
  end

end
