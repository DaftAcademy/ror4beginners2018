class TeamsController < ApplicationController
  def index
    @index = random_teams
  end

  def random_teams
    captains = Player.where(captain: true).first(2).shuffle.each_slice(1).to_a
    players = Player.where(captain: false).first(20).shuffle.each_slice(10).to_a
    team1 = [captains.first,players.first].flatten!
    team2 = [captains.second,players.second].flatten!
    @teams = [team1, team2]
  end
end
