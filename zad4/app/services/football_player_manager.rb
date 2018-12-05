# frozen_string_literal: true

class FootballPlayerManager < ActiveRecord::Base
  attr_reader :player

  def initialize(player)
    @player = player
    
  end

  def stronger_players
<<<<<<< HEAD
    #@players = Players.all
    #@players.each = {|link| p link}
    Player.where('power > ?', player.power)
    #puts @stronger
  end

  def set_power(value)
    player.update(power: value)
  end

  def copy_player
    copy = player.dup
    copy.save
    return copy
=======
    Player.where('power > ?', player.power)
  end

  def set_power(value)
    player.update!(power: value)
  end

  def copy_player
    new_player = player.dup
    new_player.save!
    new_player
>>>>>>> 5ce1fe2de31db652fbead0b82e9d9d1a04d1d8ca
  end
end
