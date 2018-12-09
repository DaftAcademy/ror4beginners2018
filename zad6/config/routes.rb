Rails.application.routes.draw do
    resources :customers, only: %i[index] do
    resources :products, only: %i[index]
    end
end
