class TeamsController < ApplicationController
  def create_teams
    players = Player.where(captain: false).order(Arel.sql('random()')).first(20).in_groups(2)
    captains = Player.where(captain: true).order(Arel.sql('random()')).first(2)
    @teams = [players.first.push(captains.pop), players.last.push(captains.pop)]
  end
end
