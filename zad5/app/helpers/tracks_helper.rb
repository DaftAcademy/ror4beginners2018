module TracksHelper

  def read_playlist track
    playlist = PlaylistTrack.find_by(track_id: track.id)
    Playlist.find(playlist.playlist_id) if playlist
  end

  def artist track
    Artist.find(track.artist_id)
  end

end
