class Character
  attr_accessor :name :level

  def initialize(name, level)
    @name = name
    @level = level
  end
end

class Warrior < Character
end

class Monster < Character
end

class BattleArena
  def initialize(first_character, second_character)
    @first_character = Warrior.new
    @second_character = Monster.new
  end

  def dice_throw
    dice_points = [1..12].sample
  end

  def strength
    strength = level + dice_points
  end

  def add_points
    if first_character.level == second_character.level
      first_character.strength += 1
    elsif first_character.level < second_character.level
      first_character.strength += (1 + (second_character.level - first_character.level))
    else
      first_character.strength
    end
  end

  def card
    puts "#{name} (#{level})"
  end

  def battle!
    first_character.dice_throw
    second_character.dice_throw
    if first_character.strength > second_character.strength
      puts "#{first_character.name} won"
      add_points
    else
      puts "#{second_character.name} won"
  end
end

end