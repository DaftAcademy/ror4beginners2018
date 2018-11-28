
class FootballPlayerManager
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def stronger_players
    # TODO: Implement me pls

    Player.where('power > ? ', player.power)

  end

  def set_power(value)
    # TODO: I need body

    player.update(power: value)

  end

  def copy_player
    # TODO: I feel empty inside

    copyed_player = player.dup
    copyed_player.save
    return copyed_player

  end
end
