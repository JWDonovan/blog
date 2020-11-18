Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  
  resources :posts

  get 'latest', to: 'posts#latest'
end
