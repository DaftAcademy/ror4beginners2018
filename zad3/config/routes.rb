# frozen_string_literal: true

Rails.application.routes.draw do
  get 'bestiary/index', to: 'bestiary#index', as: :r_index
  get 'bestiary/novigrad_monsters', to: 'bestiary#novigrad_monsters', as: :r_novigrad_monsters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
