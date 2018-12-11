Rails.application.routes.draw do
  get 'nest_products/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :customers do
    resources :products, controller: :nest_products
  end
  resources :products
end
