# frozen_string_literal: true

class FootballPlayerManager
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def stronger_players
    Player.where(power: (@player.power+1)..100)
  end

  def set_power(value)
    player.update(power: value)
  end

  def copy_player
    copy = @player.dup
    copy.save
    copy
  end
end
