# frozen_string_literal: true

class FootballPlayerManager
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def stronger_players

    # TODO: Implement me pls
  end

  def set_power(value)
    # TODO: I need body
  end

  def copy_player
    # TODO: I feel empty inside

    Player.where('power > ?', player.power)
  end

  def set_power(value)
    player.update!(power: value)
  end

  def copy_player
    new_player = player.dup
    new_player.save!
    new_player

  end
end
