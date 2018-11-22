# frozen_string_literal: true

class FootballPlayerManager
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def stronger_players
    Player.all.select  { |player| player.score > player.score}
  end

  def set_power(value)
    @player.score = value
  end

  def copy_player
    # TODO: I feel empty inside
  end
end
