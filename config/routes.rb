Rails.application.routes.draw do
  root 'post#index'
  resource :post
end
