Rails.application.routes.draw do
  get 'home/random'
  get '/', to: 'teams#random'
end
