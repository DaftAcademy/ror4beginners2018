# frozen_string_literal: true

class FootballPlayerManager
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def stronger_players
    player.where('power > ?', player.power)
  end

  def set_power(value)
    player.update(power :value)
  end

  def copy_player
    player_copy = player.dup
    player_copy.save
    player_copy
  end
end
