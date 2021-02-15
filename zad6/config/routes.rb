Rails.application.routes.draw do
  resources :customers do
    resources :products
  end
  resources :products
end
