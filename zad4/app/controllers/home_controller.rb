class HomeController < ApplicationController
  def random
    @teams = generate_random_teams
  end
   private
     def generate_random_teams
      captains = Player.where(captain: true)
                       .order(Arel.sql('random()'))
                       .first(2)
      players = Player.where(captain: false)
                      .order(Arel.sql('random()'))
                      .first(20)
                      .each_slice(10)
                      .to_a
       team1 = [captains.first, players.first].flatten
      team2 = [captains.second, players.second].flatten
      [team1, team2]
    end
end
