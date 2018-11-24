class TeamsController < ApplicationController
  def index
    players = Player.order("random()").where(captain: false).limit(20)
    captains = Player.where(captain: true).order("random()").limit(2)
    @team1, @team2 = players.each_slice(10).to_a
    @team1.unshift(captains.first) 
    @team2.unshift(captains.second)
  end
end