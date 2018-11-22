# frozen_string_literal: true

class FootballPlayerManager
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def stronger_players
    Player.all.select  { |player| player.score > self.score}
  end

  def set_power(value)
    # TODO: I need body
  end

  def copy_player
    # TODO: I feel empty inside
  end
end
