# frozen_string_literal: true

Rails.application.routes.draw do
  get 'bestiary', to: "bestiary#index", as: :bestiary
  get 'bestiary/novigrad_monsters', to: "bestiary#novigrad_monsters", as: :bestiary_novigrad_monsters
end
