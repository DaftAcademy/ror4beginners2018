Rails.application.routes.draw do
  get '/', to: 'teams#random', as: :random_teams
end
