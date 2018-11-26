class TeamsController < ApplicationController
  def index
  	@captains=Player.where(captain: true).to_a
  	@players=Player.where(captain: false).to_a
    @teams=@players.count/@captains.count
    @random_captains=@captains.sample(@teams)
    @random_players=@players.sample(@teams*10)
  end
end
