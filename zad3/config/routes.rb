# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/welcome'
  get 'bestiary/index'
  get 'bestiary/novigrad_monsters'
  get '/', to: 'home#welcome', as: :home
  get '/index', to: 'bestiary#index', as: :index
  get '/novigrad', to: 'bestiary#novigrad_monsters', as: :novigrad
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
