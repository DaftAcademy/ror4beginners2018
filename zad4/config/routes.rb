Rails.application.routes.draw do
   get 'teams/index'
  get '/', to: 'teams#index', as: :root
end
