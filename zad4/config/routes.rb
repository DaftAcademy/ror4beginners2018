Rails.application.routes.draw do
  get 'home/team'
  	get '/', to: 'home#team'
end
