Rails.application.routes.draw do
  get 'teams_controller/index', to: 'teams_controller#index', as: :t_index

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
