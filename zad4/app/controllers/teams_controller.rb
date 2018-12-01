class TeamsController < ApplicationController
  def index
    players = Player.order("random()").where(capitan: false).first(20)
    capitans = Player.order("random()").where(capitan: true).first(2)
    @team1, @team2 = players.each_slice(10).to_a
    @team1.unshift(capitans.first)
    @team2.unshift(capitans.second)
  end
end
