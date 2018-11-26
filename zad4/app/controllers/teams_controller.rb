class TeamsController < ApplicationController
  def index
  	@captains=Player.where(captain: true).to_a
  	@players=Player.where(captain: false).to_a

  	@number_of_teams = number_od_teams(@captains,@players)

  	@all_teams=@players.sample(@number_of_teams*10)
  	@all_teams_captains=@captains.sample(@number_of_teams)
  	
  end

  def number_od_teams(captains,players)
  	return [captains.count,players.count/10].min
  end	

end
