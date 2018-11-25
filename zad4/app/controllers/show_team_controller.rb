class ShowTeamController < ApplicationController
  def index
    captains = Player.where(captain: true).order("RANDOM()")
    players =  Player.where(captain: false).order("RANDOM()")
    team =Array.new
    @teamcol =Array.new
    i=0
    j=0
    captains.each do |f| 
      i=i+1
      team.push(f)
      (1..10).each do
        
        team.push(players[j])
        j=j+1
      end
      @teamcol.push(team)
      team =Array.new
    end
   
  end



end
