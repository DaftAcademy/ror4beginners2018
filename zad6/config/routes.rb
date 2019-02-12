Rails.application.routes.draw do
  resources :customer, param: :name, only: [:index] do
    resources :products, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
