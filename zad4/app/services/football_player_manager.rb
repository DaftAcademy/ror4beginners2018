# frozen_string_literal: true

class FootballPlayerManager
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def stronger_players
    min_power = player.power + 1
    Player.where(:power => min_power..99)
  end

  def set_power(value)
    player.update(power: value)
  end

  def copy_player
    Player.create(captain: player.captain, first_name: player.first_name, last_name: player.last_name, power: player.power)
  end
end
