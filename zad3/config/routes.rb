# frozen_string_literal: true

Rails.application.routes.draw do
  get 'bestiary_controller/index'
  get 'bestiary_controller/novigrad_monsters'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
