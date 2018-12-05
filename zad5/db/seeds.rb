# frozen_string_literal: true

karaoke = Playlist.create!(title: 'Karaoke')
karaoke_tracks = [
  Track.create!(title: 'Ruchome Piaski', artist: Artist.create(name: 'Kasia Stankiewicz')),
  Track.create!(title: 'Moja i twoja nadzieja', artist: Artist.create!(name: 'Hey')),
  Track.create!(title: 'Son Of The Blue Sky', artist: Artist.create!(name: 'Wilki')),
  Track.create!(title: 'Kolorowy wiatr', artist: Artist.create!(name: 'Edyta Górniak'))
]
karaoke_tracks.each { |track| karaoke.playlist_tracks.create!(track: track) }

chill = Playlist.create!(title: 'Chill')
chill_tracks = [
  Track.create!(title: 'Harvest moon', artist: Artist.create(name: 'Jane Birkin')),
  Track.create!(title: 'Golden Brown', artist: Artist.create!(name: 'Bedhead')),
  Track.create!(title: 'Bushel Hyde', artist: Artist.create!(name: 'Jessica Pratt')),
  Track.create!(title: 'Twin Peaks Theme', artist: Artist.create!(name: 'Angelo Badalamenti')),
  Track.create!(title: 'By This River', artist: Artist.create!(name: 'Brian Eno'))
]
chill_tracks.each { |track| chill.playlist_tracks.create!(track: track) }
