# frozen_string_literal: true

class FootballPlayerManager
  attr_reader :player

  def initialize(player)
    Player.where('power > ?', player.power)
  end

  def stronger_players
    player.power 
  end

  def set_power(value)
    Player.find(player_id).update(power: value)
  end

  def copy_player
    copy = player.dup
    copy.save
    return copy
  end
end
