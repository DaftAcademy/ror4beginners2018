class LevelError < StandardError
  def initialize
    super('Level must be an integer between 1 and 99')
  end
end

class Character
  attr_accessor :name, :level

  def initialize(name:, level:)
    @name = name
    if validate_level(level)
      @level = level
    else
      raise LevelError
    end
  end

  def card
    "#{name} (lvl #{level})"
  end

  def strength
    [*1..12].sample + level
  end

  private

  def validate_level(lvl)
    return false unless lvl.is_a?(Integer) && lvl.between?(1,99)
    return true
  end
end

class Warrior < Character
  def level_up(n)
    @level += n if validate_level(@level + n)
  end
end

class Monster < Character
end

class BattleArena
  def initialize(first_character, second_character)
    @first_character = first_character
    @second_character = second_character
  end

  def battle!
    first_character_strength = first_character.strength
    second_character_strength = second_character.strength

    attack(first_character, second_character, first_character_strength)
    attack(second_character, first_character, second_character_strength)

    if first_character_strength == second_character_strength
      puts "Draw"
    else
      winner, levels_up = if first_character_strength > second_character_strength
          [first_character, count_levels(first_character, second_character)]
        else
          [second_character, count_levels(second_character, first_character)]
        end

      puts "#{winner.name} won"
      winner.level_up(levels_up) if winner.respond_to? :level_up
    end
  end

  private

  attr_reader :first_character, :second_character

  def attack(attacker, defender, strength)
    puts "#{attacker.name} attacked #{defender.name} with #{strength} damage" 
  end

  def count_levels(winner, loser)
    if winner.level > loser.level
      0
    else
      loser.level - winner.level + 1
    end
  end
end