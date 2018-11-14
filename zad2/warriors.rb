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
  def level_up(n); end
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
  def score(winner, loser)
    puts "#{winner.name} won"
    winner.level_up([loser.level-winner.level+1,0].max)
  end
  def battle!
    damage1 = first.strength
    damage2 = second.strength
    puts "#{first.name} attacked #{second.name} with #{damage1} damage"
    puts "#{second.name} attacked #{first.name} with #{damage2} damage"
    if damage1 > damage2
        score(first, second)
    elsif damage1 < damage2
        score(second, first)
    else
      puts "It's a tie!"
    end
  end
end
