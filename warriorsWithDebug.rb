class Character
  attr_accessor :name, :level

  def initialize(name: 'default_Character', level: 1)
    @name = name
    raise 'Level is incorect. Should be from 1 to 99 range.' unless
    level.between?(1, 99)

    @level = level
  end

  def strength
    @level + [*1..12].sample
  end

  def card
    "I am the mighty #{@name}! My level is #{@level} cm long"
  end
end

class Warrior < Character
end

class Monster < Character
  def card
    "I am the scary #{@name}! My level is #{@level} and you'll be dead soon#{"\u2122"}"
  end
end

class BattleArena
  def initialize(first_character, second_character)
    @first_character = first_character
    @second_character = second_character
  end

  def battle!
    first_character_attack = attack(@first_character, @second_character)
    second_character_attack = attack(@second_character, @first_character)
    winner(first_character_attack, second_character_attack)
  end

  private

  def attack(attacker, defender)
    puts "#{attacker.name} attacked #{defender.name} with #{attack = attacker.strength} damage"
    return attack
  end

  def winner(first_character_attack, second_character_attack)
    return "It's a draw! We'll have a rematch!" if first_character_attack == second_character_attack
    if first_character_attack > second_character_attack
      count_new_level(@first_character, @second_character)
      return "#{@first_character.name} wins!"
    else
      count_new_level(@second_character, @first_character)
      return "#{@second_character.name} wins!"
    end
  end

  def count_new_level(winner, looser)
    return unless winner.is_a? Warrior

    winner.level += if winner.level >= looser.level
                      1
                    else
                      (winner.level - looser.level).abs
                    end
  end
end
