Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/football_player_manager/random_team', to: 'football_player_manager#print_all'
end
