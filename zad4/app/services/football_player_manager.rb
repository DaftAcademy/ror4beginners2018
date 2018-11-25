# frozen_string_literal: true

class FootballPlayerManager
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def stronger_players
    Player.where(power: (@player[:power]+1..99))
  end

  def set_power(value)
    if (value > 99 || value <1)
      p 'Power must be between 1 and 99'
    else 
      @player[:power] = value
      @player.save
      @player
    end
  end

  def copy_player
    new_player = Player.new
    new_player[:first_name] = @player[:first_name]
    new_player[:last_name] = @player[:last_name]
    new_player[:power] = @player[:power]
    new_player.save
    new_player
  end
end
