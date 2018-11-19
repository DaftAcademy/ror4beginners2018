# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'bestiary#index', as: :bestiary
  get '/Novigrad', to: 'bestiary#novigrad_monsters', as: :bestiary_novigrad_monsters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
