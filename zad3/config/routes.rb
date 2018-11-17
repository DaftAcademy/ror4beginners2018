# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'bestiary#index', as: :home
  get '/novigrad', to: 'bestiary#novigrad_monsters', as: :novigrad
end
