# frozen_string_literal: true

class FootballPlayerManager
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def stronger_players
    Player.where("power > #{player.power}")
  end

  def set_power(value)
   player.power = value
   player.save
  end

  def copy_player
    player_clone = Player.create(captain: player.captain, first_name: player.first_name, last_name: player.last_name, power: player.power)
  end
end
