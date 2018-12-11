# frozen_string_literal: true

class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.includes(:tracks)
  end

  def show
    @playlist = Playlist.find(params[:id])
  end
end
