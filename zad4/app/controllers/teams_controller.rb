class TeamsController < ApplicationController
  def index
    players = Player.order("random()").where(captain: false).first(20)
    captains = Player.order("random()").where(captain: true).first(2)
    @team1, @team2 = players.each_slice(10).to_a
    @team1.unshift(captains.first)
    @team2.unshift(captains.second)
  end
end
