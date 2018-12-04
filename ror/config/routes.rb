Rails.application.routes.draw do
  get 'home/welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/path', to: 'controller:action', as: :alias
  get '/', to: 'home#welcome', as: :root
  get '/who', to: 'home#who', as: :who
end
