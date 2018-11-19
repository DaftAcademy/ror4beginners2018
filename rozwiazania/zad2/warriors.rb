class Character
  attr_reader :name, :level

  MIN_LEVEL = 1
  MAX_LEVEL = 99

  def initialize(name:, level:)
    @name = name
    @level = validate_level(level)
  end

  # https://github.com/daftcode/ror4beginners2018/issues/129
  def promote(param); end

  def strength
    level + rand(1..12)
  end

  def card
    "#{name} (lvl #{level})"
  end

  private

  def validate_level(value)
    [[MIN_LEVEL, value].max, MAX_LEVEL].min
  end
end

class Monster < Character; end

class Warrior < Character
  attr_writer :level

  def promote(new_lvl)
    valid_level = validate_level(new_lvl)
    return if valid_level <= level
    puts "#{name} reached the level #{valid_level}!"
    self.level = valid_level
  end
end

class BattleArena
  def initialize(first_character, second_character)
    @first_character = first_character
    @second_character = second_character
  end

  def battle!
    strength1 = first_character.strength
    strength2 = second_character.strength

    attack(first_character, second_character, strength1)
    attack(second_character, first_character, strength2)

    winner, loser = results(strength1, strength2)

    if winner
      winner.promote(loser.level + 1)
      puts "The winner is #{winner.name}!"
    else
      puts 'Tie!'
    end
  end

  private

  attr_reader :first_character, :second_character

  def attack(character1, character2, strength)
    puts "#{character1.name} attacked #{character2.name} with #{strength} strength"
  end

  # use ruby spaceship operator to compare strength
  # https://stackoverflow.com/a/827656/3285065
  def results(strength1, strength2)
    case strength1 <=> strength2
    when -1 then [second_character, first_character]
    when 1 then [first_character, second_character]
    end
  end
end
