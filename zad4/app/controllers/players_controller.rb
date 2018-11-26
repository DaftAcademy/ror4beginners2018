class PlayersController < ApplicationController

  @@captains
  @@players

  def index
    @@captains = @@players = nil if params[:shuffle]
    setup
    @id = params[:id]
    @id ? show_player : teams
  end

  private 

  def teams
    @captains = @@captains.clone
    @players =   @@players.clone
    @team_size = 11;
    @teams = Player.all.count / @team_size;
    
  end

  def show_player
    @player = Player.where(id: @id).first
  end

  def setup
    @@captains ||= Player.where(captain: true).shuffle
    @@players ||= Player.where(captain: false).shuffle
  end

end