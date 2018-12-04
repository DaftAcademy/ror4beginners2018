# frozen_string_literal: true

Rails.application.routes.draw do
	get 'artists/index'
  get 'artists/destroy'
  get 'artists/create'
  get 'artists/update'	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'tracks#index'

  resources :tracks
  resources :playlists, only: %i[index show]
  resources :artists
end
