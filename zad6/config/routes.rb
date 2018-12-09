Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers, only: %i[index] do
    resources :products, only: %i[index]
  end
end
