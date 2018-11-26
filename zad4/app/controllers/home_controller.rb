class HomeController < ApplicationController
  def random
    captains = Player.where('captain = true').order('RANDOM()').limit(2).each_slice(1).to_a
    players = Player.where('captain = false').order('RANDOM()').limit(20).each_slice(10).to_a
    team1 = captains.first + players.first
    team2 = captains.second + players.second
    @teams = [team1, team2]
  end
end
