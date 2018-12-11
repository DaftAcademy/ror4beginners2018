Rails.application.routes.draw do
  root:to => redirect('customers')
  resources :customers, only: [:index] do
    resources :products, only: [:index]
  end
end
