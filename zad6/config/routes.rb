Rails.application.routes.draw do
  root 'home#welcome'
  resources :customers
  resources :categories
  resources :products 
end
