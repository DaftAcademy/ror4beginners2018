Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect('customers')
  resources :customers, param: :name, only: [:index] do
    resources :products, only: [:index]
  end
end