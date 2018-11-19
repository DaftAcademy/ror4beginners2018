# frozen_string_literal: true

Rails.application.routes.draw do
  
  get 'bestiary', to: 'bestiary#index', as: :bestiary
  get 'bestiary/novigrad_monsters', to: 'bestiary#novigrad_monsters', as: :novigrad_monsters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
