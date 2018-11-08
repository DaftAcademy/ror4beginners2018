class Character
  attr_accessor :name, :level
  
  def initialize(name:, level:)
    self.name = name
    self.level = level
  end

  def strength
    self.level + [*1..12].sample
  end

  def card
    "#{name} (lvl #{level})"
  end
end

class Monster < Character
end

class Warrior < Character
  def level_up(n)
    self.level += n
  end
end

class BattleArena
  attr_accessor :first, :second

  def initialize(first_character, second_character)
    self.first = first_character
    self.second = second_character
  end
  def battle!
    damage1 = first.strength
    damage2 = second.strength
    puts "#{first.name} attacked #{second.name} with #{damage1} damage"
    puts "#{second.name} attacked #{first.name} with #{damage2} damage"
    if damage1 > damage2
      winner = first
      loser = second
    elsif damage1 < damage2
      winner = second
      loser = first
    else
      puts "It's a tie!"
      return
    end
    puts "#{winner.name} won"
    if winner.is_a? Warrior and winner.level <= loser.level
        winner.level_up(loser.level-winner.level+1)
    end
  end
end
