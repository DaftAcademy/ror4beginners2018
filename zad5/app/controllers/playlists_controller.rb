# frozen_string_literal: true

class PlaylistsController < ApplicationController
  def show
    @playlist = Playlist.find(params[:id])
  end

  def index
    @playlists = Playlist.includes(:tracks)
  end
end
