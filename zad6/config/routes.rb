Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers, only: :index do
  	resources :products, only: :index
  end
end
