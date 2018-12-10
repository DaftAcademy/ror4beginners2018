Rails.application.routes.draw do
  get 'products/index'
  get 'customers/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers
  resources :products
end
