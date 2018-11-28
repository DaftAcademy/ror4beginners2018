Rails.application.routes.draw do
  get 'teams/index'
  get '/', to: 'teams#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
