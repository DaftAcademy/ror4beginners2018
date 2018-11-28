class TeamsController < ApplicationController
  def index
    @teams = create_teams
  end

  def create_teams
    captains = Player.where('captain')
                     .order(Arel.sql('random()')).first(2)
    players = Player.where.not('captain')
                    .order(Arel.sql('random()')).first(20).each_slice(10).to_a
    team1 = players.first.unshift(captains.first)
    team2 = players.last.unshift(captains.last)
   [team1, team2]
  end

end
