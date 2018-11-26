class TeamController < ApplicationController

  def random_players
    @usual_players = Player.where("captain = false")
    @random_players = @usual_players.sample(10)
  end

  def random_captain
    @captain_players = Player.where("captain = true")
    @random_captain = @captain_players.sample(1)
  end

  def random_team
    @players = random_players + random_captain
  end

end
