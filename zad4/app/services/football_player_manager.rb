# frozen_string_literal: true

class FootballPlayerManager
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def stronger_players

    Player.where("power>?", @player.power)
    # TODO: Implement me pls
  end

  def set_power(value)
    @player.update(power: value)
    # TODO: I need body
  end

  def copy_player
    #newPlayer = @player.clone
    newPlayer = @player.dup
    newPlayer.save
    @player = newPlayer
    
    # TODO: I feel empty inside
  end
end
