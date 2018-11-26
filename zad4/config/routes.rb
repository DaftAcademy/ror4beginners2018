Rails.application.routes.draw do
  get '/', to: 'team#random_team'
end
