# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'bestiary#index', as: :root
  get '/novigrad_monsters', to: 'bestiary#novigrad_monsters', as: :monsters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
