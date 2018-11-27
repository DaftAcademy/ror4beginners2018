Rails.application.routes.draw do
  root:to => 'teams#index'
  get 'teams/index', to: 'teams#index', as: :index
end
