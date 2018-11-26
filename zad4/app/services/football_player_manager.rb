# frozen_string_literal: true

class FootballPlayerManager
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def stronger_players
    Player.where('power > ?', player.power)
  end

  def set_power(value)
    Player.find(player.id).update(power: value)
  end

  def copy_player
    copied_player = player.dup
    copied_player.save
    copied_player
  end
end
