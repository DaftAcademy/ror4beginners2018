class Character
  attr_accessor :name
  attr_accessor :level

  MIN_LEVEL = 1
  MAX_LEVEL = 99

  def initialize(name:, level:)
    @level = validate_level(level)
    @name = name
  end

  def strength
    @level + [*1..12].sample
  end

  def card
    "#{@name} (lvl #{@level})"
  end

  private

  def validate_level(value)
    [[MIN_LEVEL, value].max, MAX_LEVEL].min
  end
end

class Warrior < Character
  def levelup(opponent_level)
    @level += opponent_level - @level + 1 if @level <= opponent_level
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
    strength1 = @first_character.strength
    strength2 = @second_character.strength

    attack(@first_character, @second_character, strength1)
    attack(@second_character, @first_character, strength2)

    winner, loser = result(strength1, strength2)

    if winner
      winner.levelup(loser.level)
      puts "#{winner.name} won!"
    else
      puts 'Draw!'
    end
  end

  private

  def attack(attacker, defender, strength)
    puts "#{attacker.name} attacked #{defender.name} with #{strength} strength"
  end

  def result(strength1, strength2)
    case strength1 <=> strength2
    when -1 then [@second_character, @first_character]
    when 1 then [@first_character, @second_character]
    end
  end
end
