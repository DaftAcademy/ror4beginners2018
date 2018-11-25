class TeamsControllerController < ApplicationController
  def index
    players = Player.where(captain: false).order("random()").limit(20)
    captains = Player.where(captain: true).order("random()").limit(2)
    @team1, @team2 = players.each_slice(10).to_a
    @team1.unshift(captains.first) 
    @team2.unshift(captains.second)
  end
end
