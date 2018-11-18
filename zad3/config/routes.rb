# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'bestiary#index', as: :root
  get '/novigrad_monsters', to: 'bestiary#novigrad_monsters', as: :novigrad
end
