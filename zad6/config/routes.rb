Rails.application.routes.draw do
  resources :products, only: :index
  resources :customers, param: :id, only: %i[index show] do
    resources :products, only: :index, controller: :customer_products
  end
end
