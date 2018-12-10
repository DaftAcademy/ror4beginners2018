class FootballPlayerManager
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def stronger_players
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

  def power_diff(player_power, other_player_power)
    other_power = other_player.power
    power = player.power
    case other_power <=> power
    when 1
      other_power - power
    when 0
      0
    when -1
      power - other_power
    end
  end
end
