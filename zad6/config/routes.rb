Rails.application.routes.draw do
  get 'products/index'
  get 'customers/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'customers#index'
  
  resources :customers, param: :name, only: [:index] do
    resources :products, only: [:index]
  end
end
