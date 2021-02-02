class Character
  attr_accessor :name, :level

  def initialize(name:, level:)
    self.name = name
    self.level = (level.is_a? Integer) && level.between?(1,99) ? level : 1
  end

  def card
    "#{name} (lvl #{level})"
  end

  def strength
    level + [*1..12].sample
  end

end

class Warrior < Character

  def level_up(loser)
    if level >= loser.level
      @level += 1
    else
      @level = loser.level + 1
    end
    if level >= 99
      puts "#{name} reached maximum level. Congratulations!"
      @level = 99
    end
  end 

end

class Monster < Character
end

class BattleArena
  attr_accessor :first_character, :second_character

  def initialize(first_character, second_character)
    self.first_character = first_character
    self.second_character = second_character
  end

  def battle!
    damage1 = first_character.strength
    damage2 = second_character.strength
    puts "#{first_character.name} attacked #{second_character.name} with #{damage1} damage"
    puts "#{second_character.name} attacked #{first_character.name} with #{damage2} damage"

    if damage1 == damage2
      puts "It's a draw. Let's fight again!"
    elsif damage1 > damage2
      winner = first_character
      loser = second_character
    else
      winner = second_character
      loser = first_character
    end

    if winner 
      "#{winner.name} won"  
    end 

    if winner.is_a?(Warrior)
      winner.level_up(loser)
    end

  end

end
