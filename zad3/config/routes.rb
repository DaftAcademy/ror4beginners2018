# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'bestiary#index', as: :home
  get '/novigrad', to: 'bestiary#novigrad_monsters', as: :novigrad
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
