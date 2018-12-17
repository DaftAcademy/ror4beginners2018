load 'dice.rb'

class Character
  include Dice
  attr_reader :name, :level

  def initialize(name, level)
    @name = name;
    @level = level < 100 ? level : 1
  end

  def strength
    @level + roll
  end

  def card
    "#{name} (lvl #{level})"
  end

  def attack enemy
    damage = self.strength
    puts "#{name} attacked #{enemy.name} with #{damage} damage"
    damage
  end
end