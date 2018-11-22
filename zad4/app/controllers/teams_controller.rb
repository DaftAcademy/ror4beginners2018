class TeamsController < ApplicationController
  def index
    teams = CreateTeams()
    AssingCaptainsToTeams(teams)
    AssingPlayersToTeams(teams)
    @teams = teams
  end

  private 

  def CreateTeams
    Array.new(Player.all.length / 11) { |i| { name: "Team #{i + 1}", players: [] } }
  end

  def AssingCaptainsToTeams(arr)
    Player.where('captain').each_with_index do |captain, i| 
      arr[i][:players].push(captain)
    end
  end

  def AssingPlayersToTeams(arr)
    Player.where.not('captain').each do |player| 
      random = rand(arr.length)
      while arr[random][:players].length > 10
        random = rand(arr.length)
      end
      arr[random][:players].push(player)  
    end
  end
end
