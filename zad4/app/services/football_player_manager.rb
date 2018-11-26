# frozen_string_literal: true

class FootballPlayerManager < ActiveRecord::Base
  attr_reader :player

  def initialize(player)
    @player = player
    
  end

  def stronger_players
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
  end
end
