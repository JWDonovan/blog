Rails.application.routes.draw do
  root 'posts#index'
  
  resources :posts

  get 'latest', to: 'posts#latest'
end
