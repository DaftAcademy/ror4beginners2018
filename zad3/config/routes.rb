# frozen_string_literal: true

Rails.application.routes.draw do
  
  get 'bestiary/index', to: 'bestiary#index', as: :root
  get 'bestiary/novigrad_monsters', to: 'bestiary#welcome', as: :novi

  root 'bestiary#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
