Rails.application.routes.draw do
  resources :customers, only: :index do
    get '/products', to: 'customers#customer_products'
  end

  get '/products', to: 'products#index'
end
