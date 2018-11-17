# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'bestiary#index', as: :root
  get 'bestiary/novigrad_monsters', as: :novigradmonster
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
