# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'bestiary#index', as: :index
  get '/novigrad_monsters', to: 'bestiary#novigrad_monsters', as: :novigrad_monsters
  get '/g_monsters', to: 'bestiary#g_monsters', as: :g_monsters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

