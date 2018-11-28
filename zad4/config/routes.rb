Rails.application.routes.draw do
	get 'teams/get_random_teams'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get '/', to: 'teams#get_random_teams', as: :get_random_teams
end