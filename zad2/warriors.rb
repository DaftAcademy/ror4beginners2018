class Character
  attr_accessor :name, :level
  def initialize(name:, level:)
    @name = name
    @level = level
  end

  def strength
    @level + [*1..12].sample
  end

  def card
    "#{@name} is on #{@level} level"
  end
end

class Monster<Character

end

class Warrior<Character

end

class BattleArena
  attr_accessor :first_character, :second_character
  def initialize(first_character, second_character)
    @first_character = first_character
    @second_character = second_character
  end

  def battle!
    dmg_first = @first_character.strength
    dmg_second = @second_character.strength

    print_battle_info(@first_character, @second_character, dmg_first)
    print_battle_info(@first_character, @second_character, dmg_second)

    if (dmg_first > dmg_second)
      battle_result(@first_character, @second_character)
    elsif (dmg_first < dmg_second)
      battle_result(@second_character, @first_character)
    else
      puts 'Draw'
    end

  end

  private
  def print_battle_info(first, second, strength)
    puts "#{first.name} attacked #{second.name} with #{strength}"
  end

  def level_up(winner, loser)
    if winner.level == loser.level
      1
    elsif loser.level > winner.level
      loser.level - winner.level + 1
    else
      0
    end
  end

  def battle_result(winner, loser)
    puts "#{winner} won"
    level_up = level_up(winner, loser)
    if winner.is_a? Warrior
      if (winner.level + level_up) > 99
        winner.level = 99
      else
        winner.level += level_up
      end
    end
  end

end

